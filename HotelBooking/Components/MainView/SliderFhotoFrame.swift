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
        VStack(alignment: .leading, spacing: 0){
            HBFhotoSlider(images: images)
                .cornerRadius(15)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text(String(mark) + " " + rateName)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 16)
                            .weight(.medium)
                    )
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
            .cornerRadius(5)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
            .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 22)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text(adress)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
            }
            .frame(width: 343, alignment: .topLeading)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            HStack(spacing: 8 ){
                Text("от " + String(price) + " " + "₽")
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 30)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                Text(pricefor)
                    .font(Font.custom("SFProDisplay-Regular", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
    }
}

