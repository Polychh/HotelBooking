//
//  HBHstack.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct HBHstack: View {
    var text: String? = "3-я линия"
    var text1: String? = "Платный Wi-Fi в фойе"
    
    var body: some View {
        HStack(spacing: 8) {
            Text(text ?? "")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                .cornerRadius(5)
            Text(text1 ?? "")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                .cornerRadius(5)
            Spacer()
        }
        .font(
            Font.custom("SFProDisplay-Regular", size: 16)
                .weight(.medium))
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
    }
}

#Preview {
    HBHstack()
}
