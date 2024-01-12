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
            CostFrameStack(text1: ConstBooking.titleCostFrame1, text2: formated(valueInt: tourPrice) + ConstMain.space + ConstMain.rub)
            CostFrameStack(text1: ConstBooking.titleCostFrame2, text2: formatedOneSpace(valueInt: fuelCharge) + ConstMain.space + ConstMain.rub)
            CostFrameStack(text1: ConstBooking.titleCostFrame3, text2: formatedOneSpace(valueInt: serviceCharge) + ConstMain.space + ConstMain.rub)
            HStack(spacing: 0){
                Text(ConstBooking.toPay)
                    .foregroundColor(ConstMain.grayFontColor)
                    .font(
                        Font.custom(ConstMain.fontDisplayReg, size: 16))
                Spacer()
                Text(formated(valueInt: tourPrice + fuelCharge + serviceCharge) + ConstMain.space + ConstMain.rub)
                    .foregroundColor(ConstMain.blueColor)
                    .font(.custom(ConstMain.fontDisplaySem, size: 16))
            }
        }
        .padding(16)
    }
}

