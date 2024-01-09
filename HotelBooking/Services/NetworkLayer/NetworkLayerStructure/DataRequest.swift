//
//  DataRequest.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import Foundation

protocol DataRequest {
    associatedtype Response
    var url: EndPoints { get }
    var method: HTTPMethods { get }
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Response.self, from: data)
    }
}
