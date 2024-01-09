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
                    .font(Font.custom("SFProDisplay-Regular", size: 22)
                        .weight(.bold))
                Spacer()
                Button(
                    action: { self.collapsed.toggle() },
                    label: {
                        
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 16)
                            .frame(width: 32, height: 32)
                            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                            .cornerRadius(6)
                    }
                )
                .buttonStyle(DefaultButtonStyle())
            }
            .background(Color.white.opacity(0.01))
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 8)
            VStack {
                self.content()
                    .frame(maxWidth: .infinity)
                    .opacity(collapsed ? 0 : 1)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
    }
}

