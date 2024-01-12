//
//  HotelRooms.swift
//  HotelBooking
//
//  Created by Polina on 27.12.2023.
//

import SwiftUI

struct HotelRoomItem: View {
    @EnvironmentObject var nav: NavigationStateManager
    var id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [String]
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8){
                HBFhotoSlider(images: imageUrls)
                    .cornerRadius(15)
                    .padding(.horizontal, 16)
                Text(name)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 22)
                            .weight(.medium)
                    )
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                HBHstack(text: peculiarities[0], text1: peculiarities[1])
                    .padding(.horizontal, 16)
                if peculiarities.count > 2{
                    HBHstack(text: peculiarities[2], text1: nil)
                        .padding(.horizontal, 16)
                }
                HStack(alignment: .center, spacing: 12) {
                    Text(ConstHotelRoom.aboutRoomTitle)
                        .font(
                            Font.custom(ConstMain.fontDisplayReg, size: 16)
                                .weight(.medium)
                        )
                    Image(systemName: ConstHotelRoom.chevronImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 14)
                }
                .padding(.leading, 10)
                .padding(.trailing, 8)
                .padding(.vertical, 5)
                .background(ConstMain.blueColor.opacity(0.1))
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .foregroundColor(ConstMain.blueColor)
                .padding(.bottom, 8)
                .padding(.leading, 16)
                HStack(spacing: 8 ){
                    Text(formated(valueInt: price) + ConstMain.space + ConstMain.rub)
                        .font(
                            Font.custom(ConstMain.fontDisplayReg, size: 30)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Text(pricePer)
                        .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                        .foregroundColor(ConstMain.grayFontColor)
                    
                }
                .padding(.leading, 16)
                .padding(.bottom, 8)
                Button {
                    nav.goToBookingView()
                } label: {
                    HBButton(title: ConstHotelRoom.buttonTitle, width: UIScreen.main.bounds.width  - 32, height: 48)
                }
            }
            .padding(.vertical, 16)
    }
}

