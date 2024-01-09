//
//  HBFhotoSlider.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct HBFhotoSlider: View {
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                AsyncImage(url: URL(string: item)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 257)
        .onAppear {
            setupAppearance()
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

