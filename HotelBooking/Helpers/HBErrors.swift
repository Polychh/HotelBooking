//
//  HBErrors.swift
//  HotelBooking
//
//  Created by Polina on 26.12.2023.
//

import Foundation

enum HBErrors: Error, LocalizedError{
    case invalidURL
    case invalidResponce
    case invalidData
    case unknow(Error)
    
    var errorDescription: String?{ 
        switch self{
        case .invalidURL:
            return "Wrong URL"
        case .invalidResponce:
            return "Wrong Response"
        case .invalidData:
            return "Can not decode Data"
        case .unknow(let error):
            return error.localizedDescription
        }
    }
}
