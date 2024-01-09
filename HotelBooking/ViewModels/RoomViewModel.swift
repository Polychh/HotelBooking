//
//  RoomViewModel.swift
//  HotelBooking
//
//  Created by Polina on 30.12.2023.
//

import SwiftUI

final class RoomViewModel: ObservableObject{
    let networkManager: NetworkManger
    @Published var roomInfo = [Room]()
    @Published var error: Error?
    @Published var loading: Bool = false
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
        loadData()
    }
    private func loadData(){
        Task{
            try await fetchRoomInfo()
        }
    }
    
    @MainActor
    private func fetchRoomInfo() async throws{
        let request = RoomInfoRequest()
        do{
            let info = try await networkManager.request(request)
            roomInfo = info.rooms
            loading = true
        }catch{
            self.error = error
            print(error.localizedDescription)
        }
    }
}

