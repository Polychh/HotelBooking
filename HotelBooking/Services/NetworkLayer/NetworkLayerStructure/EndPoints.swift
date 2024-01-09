//
//  EndPoints.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

enum EndPoints{
    private var baseURL: String { return "https://run.mocky.io/v3/" }
    
    case getMainInfo
    case getRoomInfo
    case getBookingInfo
    
    var fullPath: String {
        var endpoint: String
        switch self{
        case .getMainInfo:
            endpoint = "d144777c-a67f-4e35-867a-cacc3b827473"
        case .getRoomInfo:
            endpoint = "8b532701-709e-4194-a41c-1a903af00195"
        case .getBookingInfo:
            endpoint = "63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
        return baseURL + endpoint
    }
}

