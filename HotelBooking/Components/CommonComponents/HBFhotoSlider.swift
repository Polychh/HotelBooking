//
//  HBFhotoSlider.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct HBFhotoSlider: View {
    var images: [String]
    @State var currentIndex: Int = 0
    
    var body: some View {
        ZStack(){
            TabView(selection: $currentIndex){
                ForEach(0..<images.count, id: \.self) { index in
                    AsyncImage(url: URL(string: images[index])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .tag(index)
                }
            }
            .frame(height: 257)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            VStack{
                Spacer()
                CustomTabIndicator(count: images.count, current: $currentIndex)
            }
            .padding(.bottom, 8)
        }
    }
}

