//
//  String + ext.swift
//  HotelBooking
//
//  Created by Polina on 31.12.2023.
//

import Foundation

extension String{
    func formattedMask(text: String, mask: String?) -> String{
        let cleanNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanNumber.startIndex
        if let mask = mask{
            for ch in mask where index < cleanNumber.endIndex{
                if ch == ConstHelpers.maskSymbol{
                    result.append(cleanNumber[index])
                    index = cleanNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            }
        }
        return result
    }
}
