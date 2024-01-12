//
//  Collapsable.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//
import SwiftUI

struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            HStack{
                self.label()
                    .foregroundColor(.black)
                    .font(Font.custom(ConstMain.fontDisplayReg, size: 22)
                        .weight(.medium))
                Spacer()
                Button(
                    action: { self.collapsed.toggle() },
                    label: {
                        Image(systemName: self.collapsed ? ConstBooking.chevronDownImage : ConstBooking.chevronUpImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 16)
                            .frame(width: 32, height: 32)
                            .background(ConstMain.blueColor.opacity(0.1))
                            .cornerRadius(6)
                    }
                )
                .buttonStyle(DefaultButtonStyle())
            }
            .background(Color.white.opacity(0.01))
            .padding(.horizontal, 16)
            .padding(.top, 13)
            .padding(.bottom, 5)
            VStack {
                self.content()
                    .frame(maxWidth: .infinity)
                    .opacity(collapsed ? 0 : 1)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .transition(.slide)
        }
    }
}

