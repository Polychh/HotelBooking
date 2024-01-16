//
//  SwiftUIView.swift
//  HotelBooking
//
//  Created by Polina on 15.01.2024.
//

import SwiftUI

struct CustomTabIndicator: View {
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        HStack(spacing: 5){
            ForEach(0..<count,id: \.self){ index in
                ZStack{
                    if current == index{
                        Circle()
                            .fill(Color.black)
                    } else{
                        Circle()
                            .fill(Color.black).opacity(0.17)
                    }
                }
                .frame(width: 7, height: 7)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
    }
}

