//
//  BookingInfoRequest.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

struct BookingInfoRequest: DataRequest{
    typealias Response = BookingModel
    
    var url: EndPoints{
        .getBookingInfo
    }
    
    var method: HTTPMethods {
        .GET
    }
}
