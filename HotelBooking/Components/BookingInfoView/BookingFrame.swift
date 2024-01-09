//
//  BookingFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct BookingFrame: View {
    var departure, arrivalCountry, tourDateStart, tourDateStop: String
    var numberOfNights: Int
    var hotelName, room, nutrition: String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 16){
            BookingFrameStack(text1: "Вылет из", text2: departure)
            BookingFrameStack(text1: "Страна, город", text2: arrivalCountry)
            BookingFrameStack(text1: "Даты", text2: tourDateStart + "-" + tourDateStop)
            BookingFrameStack(text1: "Кол-во ночей", text2: String(numberOfNights) + " ночей")
            BookingFrameStack(text1: "Отель", text2: hotelName)
            BookingFrameStack(text1: "Номер", text2: room)
            BookingFrameStack(text1: "Питание", text2: nutrition)
        }
        .font(
            Font.custom("SFProDisplay-Regular", size: 16))
        .padding(16)
    }
}

