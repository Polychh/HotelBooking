//
//  SectionViewModel.swift
//  HotelBooking
//
//  Created by Polina on 03.01.2024.
//

import SwiftUI
import Combine

final class SectionViewModel: ObservableObject{
    @Published var validSections: [Bool] = []
    @Published var valid: Bool = false
    
    @Published var name = ""
    @Published var surName = ""
    @Published var dateBirth = ""
    @Published var country = ""
    @Published var pasport = ""
    @Published var datePasport = ""
    
    private var cancalableCollapse: Set<AnyCancellable> = []
    
    @Published var buttonTapped: Bool = false
    @Published private var isValidName  = false
    @Published private var isValidsurName = false
    @Published private var isValidDateBirth = false
    @Published private var isValidCountry = false
    @Published private var isValidPassport = false
    @Published private var isValidDatePassport = false
    @Published var canSubmitCollapse: Bool = false
    
    var nameColor: Bool?{
        isValidProperty(valid: isValidName)
    }
    var surnameColor: Bool?{
        isValidProperty(valid: isValidsurName)
    }
    var dateBirthColor: Bool?{
        isValidProperty(valid: isValidDateBirth)
    }
    var countryColor: Bool?{
        isValidProperty(valid: isValidCountry)
    }
    var passportColor: Bool?{
        isValidProperty(valid: isValidPassport)
    }
    
    var datePassportColor: Bool?{
        isValidProperty(valid: isValidDatePassport)
    }
    
    private func isValidProperty(valid: Bool) -> Bool?{
        if valid == true {
            return false
        } else if self.buttonTapped == true && valid == false {
            return true
        } else {
            return false
        }
    }
    
    private func validStatment(input: Published<String>.Publisher.Output) -> Bool{
        if self.buttonTapped == true && input.count < 2{
            return false
        } else if input.count >= 2{
            return true
        } else{
            return false
        }
    }
    
    func triggerTextFieldValidation(){
        name += ""
        surName += ""
        dateBirth += ""
        country += ""
        pasport += ""
        datePasport += ""
    }
    
    func validateCollapse(){
        $name
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else {return true}
                return validStatment(input: input)
            }
            .assign(to: \.isValidName, on: self)
            .store(in: &cancalableCollapse)
        
        $surName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else { return true }
                return validStatment(input: input)
            }
            .assign(to: \.isValidsurName, on: self)
            .store(in: &cancalableCollapse)
        
        $dateBirth
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else { return true }
                return validStatment(input: input)
            }
            .assign(to: \.isValidDateBirth, on: self)
            .store(in: &cancalableCollapse)
        
        $country
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else { return true }
                return validStatment(input: input)
            }
            .assign(to: \.isValidCountry, on: self)
            .store(in: &cancalableCollapse)
        
        $pasport
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else { return true }
                return validStatment(input: input)
            }
            .assign(to: \.isValidPassport, on: self)
            .store(in: &cancalableCollapse)
        
        $datePasport
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map {[weak self] input in
                guard let self = self else { return true }
                return validStatment(input: input)
            }
            .assign(to: \.isValidDatePassport, on: self)
            .store(in: &cancalableCollapse)
        
        [$isValidName, $isValidsurName, $isValidDateBirth, $isValidCountry, $isValidPassport, $isValidDatePassport]
            .combineLatest()
            .map { $0.allSatisfy({ item in
                item == true
            })}
            .assign(to: \.canSubmitCollapse, on: self)
            .store(in: &cancalableCollapse)
    }
}
