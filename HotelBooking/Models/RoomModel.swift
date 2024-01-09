//
//  RoomModel.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

struct RoomModel: Decodable{
    let rooms: [Room]
}

struct Room: Decodable, Identifiable {
     let id: Int
     let name: String
     let price: Int
     let pricePer: String
     let peculiarities: [String]
     let imageUrls: [String]
}
