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
            HBTextFieldCollapse(text: $sectionViewModel.name ,title: ConstBooking.titleTextFieldStack1, backgroundColor: sectionViewModel.nameColor)
            HBTextFieldCollapse(text: $sectionViewModel.surName, title: ConstBooking.titleTextFieldStack2, backgroundColor: sectionViewModel.surnameColor)
            HBTextFieldCollapse(text: $sectionViewModel.dateBirth, title: ConstBooking.titleTextFieldStack3, backgroundColor: sectionViewModel.dateBirthColor)
            HBTextFieldCollapse(text: $sectionViewModel.country, title: ConstBooking.titleTextFieldStack4, backgroundColor: sectionViewModel.countryColor)
            HBTextFieldCollapse(text: $sectionViewModel.pasport, title: ConstBooking.titleTextFieldStack5, backgroundColor: sectionViewModel.passportColor)
            HBTextFieldCollapse(text: $sectionViewModel.datePasport, title: ConstBooking.titleTextFieldStack6, backgroundColor: sectionViewModel.datePassportColor)
                .padding(.bottom, 16)
        }
        .padding(.top, 3)
    }
}

