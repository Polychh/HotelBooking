//
//  HBHstack.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct HBHstack: View {
    var text: String?
    var text1: String?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(text ?? "")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(ConstMain.lightGrayColor)
                .cornerRadius(5)
            Text(text1 ?? "")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(ConstMain.lightGrayColor)
                .cornerRadius(5)
            Spacer()
        }
        .font(
            Font.custom(ConstMain.fontDisplayReg, size: 16)
                .weight(.medium))
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .foregroundColor(ConstMain.grayFontColor)
    }
}
