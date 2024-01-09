//
//  MainInfoRequest.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

struct MainInfoRequest: DataRequest{
    typealias Response = MainModel
    
    var url: EndPoints{
        .getMainInfo
    }
    
    var method: HTTPMethods {
        .GET
    }
}
