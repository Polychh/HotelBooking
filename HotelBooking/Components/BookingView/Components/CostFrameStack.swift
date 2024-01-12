//
//  CostFrameStack.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct CostFrameStack: View {
    var text1: String
    var text2: String
    
    var body: some View {
        HStack{
            Text(text1)
                .foregroundColor(ConstMain.grayFontColor)
            Spacer()
            Text(text2)
                .foregroundColor(.black)
        }
        .font(
            Font.custom(ConstMain.fontDisplayReg, size: 16))
    }}


