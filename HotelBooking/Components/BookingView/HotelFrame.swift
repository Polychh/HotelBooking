//
//  FirstFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct HotelFrame: View {
    var ratingName, hotelName, hotelAdress: String
    var horating: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: ConstMain.imageStar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text(String(horating) + ConstMain.space + ratingName)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 16)
                            .weight(.medium)
                    )
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(ConstMain.yellowBackColor)
            .cornerRadius(5)
            .multilineTextAlignment(.center)
            .foregroundColor(ConstMain.yellowFontColor)
            Text(hotelName)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            Text(hotelAdress)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 14)
                        .weight(.medium)
                )
                .foregroundColor(ConstMain.blueColor)
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
    }
}

