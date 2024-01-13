//
//  TabBarModifier.swift
//  HotelBooking
//
//  Created by Polina on 12.01.2024.
//

import  SwiftUI

struct NavBarModifier: ViewModifier{
    let textParam: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(textParam)
                            .font(Font.custom(ConstMain.fontDisplayReg, size: 18))
                            .foregroundColor(.black)
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.white, for: .navigationBar)
    }
}

extension View {
    func navBarCustomMod(with text: String = ConstHelpers.defaultNavTittle) -> some View {
        self.modifier(NavBarModifier(textParam: text))
    }
}
