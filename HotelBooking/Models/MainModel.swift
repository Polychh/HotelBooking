//
//  MainViewModel.swift
//  HotelBooking
//
//  Created by Polina on 26.12.2023.
//

import Foundation

struct MainModel: Decodable {
    let id: Int
    let name, adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}
