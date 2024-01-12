//
//  HBTextFieldInfo.swift
//  HotelBooking
//
//  Created by Polina on 31.12.2023.
//

import SwiftUI

struct HBTextFieldInfo: View {
    private var text: Binding<String>
    private var title: String
    private var prompt: String?
    private var numberColor: Bool?
    
    init(text: Binding<String>, title: String, prompt: String? = nil, numberColor: Bool? = nil) {
        self.text = text
        self.title = title
        self.prompt = prompt
        self.numberColor = numberColor
    }
    
    var body: some View {
        ZStack(alignment:.leading){
            Text(title)
                .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                .foregroundColor(ConstBooking.grayTextFieldColor)
                .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
            TextField("", text: text)
                .foregroundColor(.black)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
        }
        .padding(.top, text.wrappedValue.isEmpty ? 0 : 10)
        .padding(.top,16)
        .padding(.bottom, text.wrappedValue.isEmpty ? 16 : 10)
        .padding(.horizontal,16)
        .background(
            prompt == nil ? ConstMain.backColor : Color(ConstBooking.promptColor).opacity(0.15),
            in: RoundedRectangle(cornerRadius: 10)
        )
        .cornerRadius(10)
        if let prompt = prompt{
            Text(prompt)
                .foregroundColor(.red)
                .font(.caption)
                .padding(.horizontal, 16)
        }
    }
}
