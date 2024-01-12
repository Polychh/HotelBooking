//
//  SecondFrame1.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct HotelInfoFrame: View {
    var descript: String
    var textInfo: [String]
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 8){
            Text(ConstMain.infoHotel)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .padding(.bottom, 8)
            HBHstack(text: textInfo[0], text1:  textInfo[1])
            HBHstack(text:  textInfo[2], text1:  textInfo[3])
                .padding(.bottom, 4)
            Text(descript)
                .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                .foregroundColor(.black.opacity(0.9))
                .padding(.bottom, 8)
            List{
                ForEach(modelList){item in
                    MainViewListItem(image: item.imageName, text: item.text, text1: item.text1)
                }
            }
            .listStyle(.plain)
            .cornerRadius(15)
            .frame(height: 178)
        }
        .padding(16)
    }
}

