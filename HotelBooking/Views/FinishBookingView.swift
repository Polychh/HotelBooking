//
//  FinishBookingView.swift
//  HotelBooking
//
//  Created by Polina on 25.12.2023.
//

import SwiftUI

struct FinishBookingView: View {
    @EnvironmentObject var nav: NavigationStateManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Spacer()
            Image(ConstFinBooking.image)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .padding(25)
                .background(ConstMain.backColor )
                .cornerRadius(1000)
                .padding(12)
            Text(ConstFinBooking.title)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 16)
            Text(ConstFinBooking.info)
                .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                .lineLimit(5)
                .multilineTextAlignment(.center)
                .foregroundColor(ConstFinBooking.colorFont)
                .padding(.horizontal, 23)
            Spacer()
            ZStack(alignment: .top){
                Button {
                    nav.popToRoot()
                } label: {
                    HBButton(title: ConstFinBooking.buttonTitle, width:  UIScreen.main.bounds.width - 32, height: 48)
                        .padding(.top, 12)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 88, alignment: .top)
            .background(.white)
        }
        .background(.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .navBarCustomMod(with: ConstFinBooking.navTitle)
    }
}

