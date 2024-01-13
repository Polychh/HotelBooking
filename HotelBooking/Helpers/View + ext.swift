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
        priceString.insert(separator: ConstHelpers.space, every: ConstHelpers.everyNumber)
        return priceString
    }
    // MARK: - Format one space
    func formatedOneSpace(valueInt: Int) -> String{
        var priceString = String(valueInt)
        let indexToInsert = priceString.index(priceString.startIndex, offsetBy: ConstHelpers.oneSpace)
        priceString.insert(" ", at: indexToInsert)
        return priceString
    }
    // MARK: - Conver index tourst to word tourist
    func convertIndexTourist(number: Int) -> String {
        if number <= ConstHelpers.maxTourist {
            return arrayNumberTourist[number]
        } else {
            return ConstHelpers.errorMaxTourist
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
