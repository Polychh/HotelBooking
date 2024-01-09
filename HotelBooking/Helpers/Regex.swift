//
//  Regex.swift
//  HotelBooking
//
//  Created by Polina on 31.12.2023.
//

import Foundation

enum Regex: String{
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case number = "(\\+\\s7)[\\s(]*\\d{3}[)\\s]*\\d{3}[\\s-]?\\d{2}[\\s-]?\\d{2}"
}
