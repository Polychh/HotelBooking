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
            Image("party")
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .padding(25)
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .cornerRadius(1000)
            Text("Ваш заказ принят в работу")
                .font(
                    Font.custom("SFProDisplay-Regular", size: 22)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 16)
                .frame(width: 343, alignment: .top)
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(Font.custom("SFProDisplay-Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                .padding(.horizontal, 23)
                .frame(width: 329, alignment: .top)
            
            Spacer()
            ZStack(alignment: .top){
                Button {
                    nav.popToRoot()
                } label: {
                    HBButton(title: "Супер", width:  UIScreen.main.bounds.width - 32, height: 48)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 88, alignment: .top)
            .background(.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Заказ оплачен")
                        .font(Font.custom("SFProDisplay-Regular", size: 18))
                }
            }
        }
    }
}

#Preview {
    FinishBookingView()
}
