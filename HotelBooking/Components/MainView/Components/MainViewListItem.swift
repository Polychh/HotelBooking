//
//  ListItem.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct MainViewListItem: View {
    var image: String = "close"
    var text: String = "Удобства"
    var text1: String = "Самое необходимое"
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 2){
                Text(text)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.17, green: 0.19, blue: 0.21))
                Text(text1)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
            Spacer()
            Image("icon")
        }
        .listRowBackground(Color.gray
            .opacity(0.1))
    }
}

#Preview {
    MainViewListItem()
}
