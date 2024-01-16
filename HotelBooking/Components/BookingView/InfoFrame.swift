//
//  InfoFrame.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct InfoFrame: View {
    @ObservedObject var viewModel: BookingViewModel
    @FocusState private var isFocusedEmail: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(ConstBooking.infoTourist)
                .font(
                    Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .padding(.bottom, 8)
            HBTextFieldInfo(text: $viewModel.phoneNumber, title: ConstBooking.numberTextField, prompt: viewModel.numberPrompt)
                .keyboardType(.numberPad)
                .onTapGesture {
                    if viewModel.phoneNumber.isEmpty{
                        viewModel.phoneNumber = ConstBooking.beginNumberFhone
                    }
                }
                .onChange(of: viewModel.phoneNumber, { oldValue, newValue in
                    if newValue == "" {
                        viewModel.phoneNumber = ConstBooking.beginNumberFhone
                    }
                    if viewModel.phoneNumber.count > ConstBooking.phoneNumberCount {
                        self.viewModel.phoneNumber = String(viewModel.phoneNumber.prefix(ConstBooking.phoneNumberCount))
                    }
                    DispatchQueue.main.async {
                        viewModel.phoneNumber = viewModel.phoneNumber.formattedMask(text: viewModel.phoneNumber, mask: ConstBooking.mask)
                    }
                })
            HBTextFieldInfo(text: $viewModel.email, title: ConstBooking.emailTextField, prompt: viewModel.emailPrompt)
                .focused($isFocusedEmail)
                .onChange(of: isFocusedEmail) { oldValue, newValue in
                    viewModel.emailFieldIsFocused = newValue
                }
                .onAppear {
                           self.isFocusedEmail =  viewModel.emailFieldIsFocused    // << read !!
                        }
            Text(ConstBooking.info)
                .font(Font.custom(ConstMain.fontDisplayReg, size: 14))
                .foregroundColor(ConstMain.grayFontColor)
        }
        .padding(16)
    }
}
