//
//  HBAddTouristButton.swift
//  HotelBooking
//
//  Created by Polina on 28.12.2023.
//

import SwiftUI

struct HBAddTouristButton: View {
    @Binding var sumSections: Int
    @ObservedObject var viewModel: BookingViewModel
    
    var body: some View {
        HStack(spacing: 0){
            Text(ConstBooking.titleAddTourist)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            Spacer()
            Button {
                self.sumSections += 1
                viewModel.addSection()
            } label: {
                Image(systemName: ConstBooking.imageButtonPlus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .background(ConstMain.blueColor)
                    .cornerRadius(6)
            }
            .disabled(sumSections == arrayNumberTourist.arrayTourist.count ? true : false)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .background(.white)
        .cornerRadius(12)
    }
}
