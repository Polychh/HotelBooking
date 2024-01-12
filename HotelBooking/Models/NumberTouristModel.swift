//
//  NumberTouristModel.swift
//  HotelBooking
//
//  Created by Polina on 11.01.2024.
//

import Foundation
struct NumberTouristModel{
    let arrayTourist: [String]
    
    
    subscript(index: Int) -> String {
        get {
            if index < 0 || index > arrayTourist.count - 1 {
                return "Неверный индекс"
            }
            return arrayTourist[index]
        }
    }
}

let arrayNumberTourist = NumberTouristModel(arrayTourist:["Первый", "Второй", "Третий", "Четвёртый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый"])
