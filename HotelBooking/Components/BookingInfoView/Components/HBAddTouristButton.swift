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
        HStack{
            Text("Добавить туриста")
                .padding(.leading, 16)
            Spacer()
            Button {
                self.sumSections += 1
                viewModel.addSection()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .background(Color(red: 0.05, green: 0.45, blue: 1))
                    .cornerRadius(6)
                    .padding(.trailing, 16)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 58)
        .background(Color.white)
        .cornerRadius(12)
    }
}
