//
//  StringProtocol + ext.swift
//  HotelBooking
//
//  Created by Polina on 11.01.2024.
//

import Foundation

extension StringProtocol where Self: RangeReplaceableCollection {
    mutating func insert<S: StringProtocol>(separator: S, every n: Int) {
        for index in indices.every(n: n).dropFirst().reversed() {
            insert(contentsOf: separator, at: index)
        }
    }
}
