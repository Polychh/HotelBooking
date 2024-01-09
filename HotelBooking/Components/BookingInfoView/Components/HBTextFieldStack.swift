//
//  HBTextFieldStack.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct HBTextFieldStack: View {
    @StateObject var sectionViewModel: SectionViewModel
    
    var body: some View {
        VStack(spacing: 8 ){
            HBTextFieldCollapse(text: $sectionViewModel.name ,title: "Имя", backgroundColor: sectionViewModel.nameColor)
            HBTextFieldCollapse(text: $sectionViewModel.surName, title: "Фамилия", backgroundColor: sectionViewModel.surnameColor)
            HBTextFieldCollapse(text: $sectionViewModel.dateBirth, title: "Дата рождения", backgroundColor: sectionViewModel.dateBirthColor)
            HBTextFieldCollapse(text: $sectionViewModel.country, title: "Гражданство", backgroundColor: sectionViewModel.countryColor)
            HBTextFieldCollapse(text: $sectionViewModel.pasport, title: "Номер загранпаспорта", backgroundColor: sectionViewModel.passportColor)
            HBTextFieldCollapse(text: $sectionViewModel.datePasport, title: "Срок действия загранпаспорта", backgroundColor: sectionViewModel.datePassportColor)
                .padding(.bottom, 8)
        }
    }
}

