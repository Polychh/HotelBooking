//
//  RoomInfoRequest.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

struct RoomInfoRequest: DataRequest{
    typealias Response = RoomModel
    
    var url: EndPoints{
        .getRoomInfo
    }
    
    var method: HTTPMethods {
        .GET
    }
}
