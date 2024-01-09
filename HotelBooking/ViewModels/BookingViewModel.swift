//
//  BookingViewModel.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import SwiftUI
import Combine

final class BookingViewModel: ObservableObject{
    // MARK: - Network properties
    let networkManager: NetworkManger
    @Published var bookingInfo = BookingModel(id: 0, hotelName: "", hotelAdress: "", horating: 0, ratingName: "", departure: "", arrivalCountry: "", tourDateStart: "", tourDateStop: "", numberOfNights: 0, room: "", nutrition: "", tourPrice: 0, fuelCharge: 0, serviceCharge: 0)
    @Published var error: Error?
    @Published var loading: Bool = false
    
    // MARK: - InfoFrame TextFields properties
    @Published var sectionArray: [SectionViewModel] = [SectionViewModel()]
    @Published var indexArray: [Int] = []
    
    @Published var email = ""
    @Published var phoneNumber = ""
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let numberPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.number.rawValue)
    private var cancalableInfo: Set<AnyCancellable> = []
    @Published private var isValidNumber = false
    @Published private var isValidEmail = false
    @Published var canSubmitInfo: Bool = false
    var anyCancellable: [AnyCancellable?] = []
    
    var emailPrompt: String?{
        isValidProperty(property: email, valid: isValidEmail, prompt: "Введите верную почту")
    }
    
    var numberPrompt: String?{
        isValidProperty(property: phoneNumber, valid: isValidNumber, prompt: "Введите номер телефона")
    }
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
        anyCancellable = sectionArray.map({ item in
            item.objectWillChange.sink { [weak self] (_) in
                self?.objectWillChange.send()
            }
        })
        loadData()
        sectionArray[0].validateCollapse()
        validateEmailNumber()
    }
    
    func addSection(){
        let section = SectionViewModel()
        section.validateCollapse()
        sectionArray.append(section)
    }
    
    private func loadData(){
        Task{
            try await fetchRoomInfo()
        }
    }
    
    private func isValidProperty(property: String, valid: Bool, prompt: String) -> String?{
        if property.isEmpty || valid == true{
            return nil
        } else{
            return prompt
        }
    }
    
    private func validateEmailNumber(){
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancalableInfo)
        
        $phoneNumber
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {number in
                return self.numberPredicate.evaluate(with: number)
            }
            .assign(to: \.isValidNumber, on: self)
            .store(in: &cancalableInfo)
        
        Publishers.CombineLatest($isValidEmail, $isValidNumber)
            .map { email, number in
                return (email && number)
            }
            .assign(to: \.canSubmitInfo, on: self)
            .store(in: &cancalableInfo)
    }
    
    @MainActor
    private func fetchRoomInfo() async throws{
        let request = BookingInfoRequest()
        do{
            bookingInfo = try await networkManager.request(request)
            loading = true
        }catch{
            self.error = error
            print(error.localizedDescription)
        }
    }
}
