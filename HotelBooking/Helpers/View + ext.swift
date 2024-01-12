//
//  View + ext.swift
//  HotelBooking
//
//  Created by Polina on 11.01.2024.
//

import SwiftUI

extension View{
    // MARK: - Format evry 3 digit
    func formated(valueInt: Int) -> String{
        var priceString = String(valueInt)
        priceString.insert(separator: " ", every: 3)
        return priceString
    }
    // MARK: - Format one space
    func formatedOneSpace(valueInt: Int) -> String{
        var priceString = String(valueInt)
        let indexToInsert = priceString.index(priceString.startIndex, offsetBy: 1)
        priceString.insert(" ", at: indexToInsert)
        return priceString
    }
    // MARK: - Conver index tourst to word tourist
    func convertIndexTourist(number: Int) -> String {
        if number <= 10 {
            return arrayNumberTourist[number]
        } else {
            return "Число превышает 10"
        }
    }
}
// MARK: - Hide KeyBoard
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
