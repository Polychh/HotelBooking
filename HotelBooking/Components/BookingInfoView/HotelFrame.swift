//
//  FirstFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct HotelFrame: View {
    var ratingName, hotelName, hotelAdress: String
    var horating: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text(String(horating) + " " + ratingName)
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
            VStack(alignment: .leading, spacing: 8){
                Text(hotelName)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 22)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text(hotelAdress)
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
            }
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
    }
}

