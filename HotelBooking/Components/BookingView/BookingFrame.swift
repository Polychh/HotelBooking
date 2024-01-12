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
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack1, text2: departure)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack2, text2: arrivalCountry)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack3, text2: tourDateStart + ConstBooking.dataSpace + tourDateStop)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack4, text2: String(numberOfNights) + ConstBooking.night)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack5, text2: hotelName)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack6, text2: room)
            BookingFrameStack(text1: ConstBooking.titleBookFrameStack7, text2: nutrition)
        }
        .font(
            Font.custom(ConstMain.fontDisplayReg, size: 16))
        .padding(16)
    }
}

