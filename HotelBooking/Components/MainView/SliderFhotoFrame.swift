//
//  FirstFrame.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct SliderFhotoFrame: View {
    var name: String
    var mark: Int
    var rateName: String
    var adress: String
    var price: Int
    var pricefor: String
    var images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HBFhotoSlider(images: images)
                .cornerRadius(15)
                .padding(.bottom, 8)
            HStack(alignment: .center, spacing: 3) {
                Image(systemName: ConstMain.imageStar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text(String(mark) + ConstMain.space + rateName)
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
            Text(name)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            Text(adress)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 14)
                        .weight(.medium)
                )
                .foregroundColor(ConstMain.blueColor)
            HStack(spacing: 8 ){
                Text(ConstMain.from + formated(valueInt: price) + ConstMain.space + ConstMain.rub)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 30)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                Text(pricefor)
                    .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                    .foregroundColor(ConstMain.grayFontColor)
            }
            .padding(.top, 8)
        }
        .padding(.horizontal, 16)
        .padding(.top, 5)
        .padding(.bottom, 16)
    }
}

