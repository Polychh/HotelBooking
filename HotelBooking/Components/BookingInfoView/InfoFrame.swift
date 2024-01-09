//
//  InfoFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct InfoFrame: View {
    @ObservedObject var viewModel: BookingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Информация о покупателе")
                .font(
                    Font.custom("SFProDisplay-Regular", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .padding(.bottom, 8)
            HBTextFieldInfo(text: $viewModel.phoneNumber, title: "Номер телефона", prompt: viewModel.numberPrompt)
                .onChange(of: viewModel.phoneNumber) {
                    DispatchQueue.main.async {
                        viewModel.phoneNumber = viewModel.phoneNumber.formattedMask(text: viewModel.phoneNumber, mask: "+ X (XXX) XXX-XX-XX")
                    }
                }
            HBTextFieldInfo(text: $viewModel.email, title: "Почта", prompt: viewModel.emailPrompt)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
        }
        .padding(16)
    }
}
