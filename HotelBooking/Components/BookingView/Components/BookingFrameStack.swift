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
        HStack(alignment: .top, spacing: 0){
            Text(text1)
                .foregroundColor(ConstMain.grayFontColor)
            Spacer()
            Text(text2)
                .foregroundColor(.black)
                .lineLimit(2)
                .frame(width: UIScreen.main.bounds.width * 0.55, alignment: .topLeading)
        }
    }
}

