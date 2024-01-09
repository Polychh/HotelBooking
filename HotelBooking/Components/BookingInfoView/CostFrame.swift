//
//  CostFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct CostFrame: View {
    var tourPrice, fuelCharge, serviceCharge: Int
    
    var body: some View {
        VStack(alignment:.leading, spacing: 16){
            CostFrameStack(text1: "Тур", text2: String(tourPrice) + " ₽")
            CostFrameStack(text1: "Топливный сбор", text2: String(fuelCharge) + " ₽")
            CostFrameStack(text1: "Сервисный сбор", text2: String(serviceCharge) + " ₽")
            HStack{
                Text("К оплате")
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .font(
                        Font.custom("SFProDisplay-Regular", size: 16))
                Spacer()
                Text(String(tourPrice + fuelCharge + serviceCharge) + " ₽")
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                    .font(.custom("SFProDisplay-Semibold", size: 16))
            }
        }
        .padding(16)
    }
}

