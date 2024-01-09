//
//  ModelList.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import Foundation

struct StructureList: Identifiable, Equatable{
    let id: Int
    let imageName: String
    let text: String
    let text1: String
}

var modelList: [StructureList] = [StructureList(id: 0, imageName: "happy", text: "Удобства", text1: "Самое необходимое"), StructureList(id: 1, imageName: "tick", text: "Что включено", text1: "Самое необходимое"), StructureList(id: 2, imageName: "close", text: "Что не включено", text1: "Самое необходимое")]

