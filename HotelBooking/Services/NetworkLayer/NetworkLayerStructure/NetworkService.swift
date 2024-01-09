//
//  NetworkService.swift
//  HotelBooking
//
//  Created by Polina on 26.12.2023.
//

import Foundation

protocol NetworkManger {
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response
}

final class NetworkService: NetworkManger {
    
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response {
        guard let url = URL(string: request.url.fullPath) else{ throw HBErrors.invalidURL}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw HBErrors.invalidResponce}
        
        do{
            let hotelInfo = try request.decode(data)
            return hotelInfo
        }catch{
            throw HBErrors.invalidData
        }
    }
}

