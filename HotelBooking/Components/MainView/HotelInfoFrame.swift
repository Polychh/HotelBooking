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
        VStack(spacing: 0){
            Text("Об отеле")
                .font(
                    Font.custom("SFProDisplay-Regular", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .frame(width: 343, alignment: .topLeading)
                .padding(.vertical, 16)
            HBHstack(text: textInfo[0], text1:  textInfo[1])
                .padding(.bottom, 8)
            HBHstack(text:  textInfo[2], text1:  textInfo[3])
                .padding(.bottom, 8)
            Text(descript)
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(.black.opacity(0.9))
                .frame(width: 343, alignment: .topLeading)
                .padding(.bottom, 16)
            List{
                ForEach(modelList){item in
                    MainViewListItem(image: item.imageName, text: item.text, text1: item.text1)
                }
            }
            .listStyle(.plain)
            .cornerRadius(15)
            .frame(maxHeight: 178)
            .padding(.bottom, 16)
        }
        .padding(.horizontal,16)
    }
}

