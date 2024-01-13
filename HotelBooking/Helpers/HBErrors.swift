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
            return ConstHelpers.netErrorUrl
        case .invalidResponce:
            return ConstHelpers.netErrorResponse
        case .invalidData:
            return ConstHelpers.netErrorData
        case .unknow(let error):
            return error.localizedDescription
        }
    }
}
