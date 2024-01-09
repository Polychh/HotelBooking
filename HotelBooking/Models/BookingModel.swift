//
//  BookingModel.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

struct BookingModel: Decodable {
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
}
