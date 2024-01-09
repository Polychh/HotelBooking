//
//  HotelRooms.swift
//  HotelBooking
//
//  Created by Polina on 27.12.2023.
//

import SwiftUI

struct HotelRoomListItem: View {
    @EnvironmentObject var nav: NavigationStateManager
    var id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [String]
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0){
                HBFhotoSlider(images: imageUrls)
                    .cornerRadius(15)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                Text(name)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 22)
                            .weight(.medium)
                    )
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                HBHstack(text: peculiarities[0], text1: peculiarities[1])
                    .padding(.bottom, 8)
                    .padding(.horizontal, 16)
                if peculiarities.count > 2{
                    HBHstack(text: peculiarities[2], text1: nil)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 16)
                }
                HStack(alignment: .center, spacing: 12) {
                    Text("Подробнее о номере")
                        .font(
                            Font.custom("SFProDisplay-Regularr", size: 16)
                                .weight(.medium)
                        )
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 14)
                }
                .padding(.leading, 10)
                .padding(.trailing, 8)
                .padding(.vertical, 5)
                .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                .cornerRadius(5)
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                .padding(.leading, 16)
                HStack(spacing: 8 ){
                    Text(String(price) + " ₽")
                        .font(
                            Font.custom("SFProDisplay-Regular", size: 30)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Text(pricePer)
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                Button {
                    nav.goToBookingView()
                } label: {
                    HBButton(title: "Выбор номера", width: proxy.size.width  - 32, height: 48)
                }
            }
        }
    }
}

