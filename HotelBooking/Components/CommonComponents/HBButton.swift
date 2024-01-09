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
            .background(Color(red: 0.05, green: 0.45, blue: 1))
            .font(
                Font.custom("SFProDisplay-Regular", size: 16)
                    .weight(.medium)
            )
            .kerning(0.1)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding()
    }
}

#Preview {
    HBButton(title: "К выбору номера", width:  UIScreen.main.bounds.width - 60, height: 50)
}

