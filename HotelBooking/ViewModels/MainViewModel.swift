//
//  MainViewModel.swift
//  HotelBooking
//
//  Created by Polina on 26.12.2023.
//

import SwiftUI

final class MainViewModel: ObservableObject{
    let networkManager: NetworkManger
    @Published var hotelInfo = MainModel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))
    @Published var error: Error?
    @Published var loading: Bool = false
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
        loadData()
    }
    
    private func loadData(){
        Task{
            try await fetchHotelInfo()
        }
    }
    
    @MainActor
    private func fetchHotelInfo() async throws{
        let request = MainInfoRequest()
        do{
            hotelInfo = try await networkManager.request(request)
            loading = true
        }catch{
            self.error = error
            print(error.localizedDescription)
        }
    }
}

