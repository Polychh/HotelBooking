//
//  HotelRoomView.swift
//  HotelBooking
//
//  Created by Polina on 27.12.2023.
//

import SwiftUI

struct HotelRoomView: View {
    @StateObject var viewModel = RoomViewModel(networkManager: NetworkService())
    var titleName: String
    
    var body: some View {
        if viewModel.loading {
                ScrollView{
                    ForEach(0..<viewModel.roomInfo.count, id: \.self){ i in
                        let item = viewModel.roomInfo[i]
                        HotelRoomItem(id: item.id, name: item.name, price: item.price, pricePer: item.pricePer, peculiarities: item.peculiarities, imageUrls: item.imageUrls)
                            .background(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.top, 8)
                .navigationBarTitleDisplayMode(.inline)
                .navBarCustomMod(with: titleName)
                .background(ConstMain.backColor)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

