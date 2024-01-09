//
//  HBTextFielStyle.swift
//  HotelBooking
//
//  Created by Polina on 31.12.2023.
//

import SwiftUI

struct HBTextFieldStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View{
        return configuration
            .padding(.leading, 16)
            .padding(.vertical, 16)
            .frame(width: UIScreen.main.bounds.width - 32, height: 52)
            .cornerRadius(10)
            .foregroundColor(.black)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}
