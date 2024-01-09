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
    
    @Published private var isValidName  = false
    @Published private var isValidsurName = false
    @Published private var isValidDateBirth = false
    @Published private var isValidCountry = false
    @Published private var isValidPassport = false
    @Published private var isValidDatePassport = false
    @Published var canSubmitCollapse: Bool = false
    
    var nameColor: Bool?{
        isValidProperty(property: name, valid: isValidName)
    }
    var surnameColor: Bool?{
        isValidProperty(property: surName, valid: isValidsurName)
    }
    var dateBirthColor: Bool?{
        isValidProperty(property: dateBirth, valid: isValidDateBirth)
    }
    var countryColor: Bool?{
        isValidProperty(property: country, valid: isValidCountry)
    }
    var passportColor: Bool?{
        isValidProperty(property: pasport, valid: isValidPassport)
    }
    
    var datePassportColor: Bool?{
        isValidProperty(property: datePasport, valid: isValidDatePassport)
    }
    
    private func isValidProperty(property: String, valid: Bool) -> Bool?{
        if property.isEmpty || valid == true {
            return false
        } else {
            return true
        }
    }
    
    func validateCollapse(){
        $name
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return input.count >= 2
            }
            .assign(to: \.isValidName, on: self)
            .store(in: &cancalableCollapse)
        $surName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return  input.count >= 2
            }
            .assign(to: \.isValidsurName, on: self)
            .store(in: &cancalableCollapse)
        
        $dateBirth
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return  input.count >= 2
            }
            .assign(to: \.isValidDateBirth, on: self)
            .store(in: &cancalableCollapse)
        
        $country
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return  input.count >= 2
            }
            .assign(to: \.isValidCountry, on: self)
            .store(in: &cancalableCollapse)
        
        $pasport
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return  input.count >= 2
            }
            .assign(to: \.isValidPassport, on: self)
            .store(in: &cancalableCollapse)
        
        $datePasport
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                return  input.count >= 2
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
