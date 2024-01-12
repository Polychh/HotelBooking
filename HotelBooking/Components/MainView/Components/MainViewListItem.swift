//
//  ListItem.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct MainViewListItem: View {
    var image: String
    var text: String
    var text1: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading, spacing: 2){
                Text(text)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(ConstMain.listItemFontColor)
                Text(text1)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(ConstMain.grayFontColor)
            }
            Spacer()
            Image(ConstMain.icon)
        }
        .listRowBackground(ConstMain.lightGrayColor)
    }
}

