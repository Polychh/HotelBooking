//
//  HBtextFieldCollapse.swift
//  HotelBooking
//
//  Created by Polina on 03.01.2024.
//

import SwiftUI

struct HBTextFieldCollapse: View {
    private var text: Binding<String>
    private var title: String
    private var backgroundColor: Bool?
    
    init(text: Binding<String>, title: String, backgroundColor: Bool? = nil) {
        self.text = text
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack(alignment:.leading){
            Text(title)
                .font(Font.custom(ConstMain.fontDisplayReg, size: 16))
                .foregroundColor(ConstBooking.grayTextFieldColor)
                .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.9, anchor: .leading)
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
            backgroundColor == false ? ConstMain.backColor  : Color(ConstBooking.promptColor).opacity(0.15),
            in: RoundedRectangle(cornerRadius: 10)
        )
        .cornerRadius(10)
    }
}
