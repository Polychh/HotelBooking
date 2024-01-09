//
//  BookingFrameStack.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct BookingFrameStack: View {
    var text1: String
    var text2: String
    
    var body: some View {
        HStack{
            Text(text1)
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(text2)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width * 0.55, alignment: .topLeading)
        }
    }
}

