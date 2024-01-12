//
//  HBButton.swift
//  HotelBooking
//
//  Created by Polina on 25.12.2023.
//

import SwiftUI

struct HBButton: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Text(title)
            .frame(width: width, height: height, alignment: .center)
            .background(ConstMain.blueColor)
            .font(
                Font.custom(ConstMain.fontDisplayReg, size: 16)
                    .weight(.medium)
            )
            .kerning(0.1)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal, 16)
    }
}


