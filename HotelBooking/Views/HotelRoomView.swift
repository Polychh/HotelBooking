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
            GeometryReader { proxy in
                List{
                    ForEach(0..<viewModel.roomInfo.count, id: \.self){ i in
                        let item = viewModel.roomInfo[i]
                        HotelRoomListItem(id: item.id, name: item.name, price: item.price, pricePer: item.pricePer, peculiarities: item.peculiarities, imageUrls: item.imageUrls)
                            .frame(width: proxy.size.width, height: proxy.size.height * 0.7)
                            .background(.white)
                            .cornerRadius(12)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
                    .scrollContentBackground(.hidden)
                    .listRowBackground(Color.gray
                        .opacity(0))
                }
                .padding(.top, 8)
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text(titleName)
                                .font(Font.custom("SFProDisplay-Regular", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .background(Color.gray
                    .opacity(0.1))
                .ignoresSafeArea(.all, edges: .bottom)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.white, for: .navigationBar)
            }
        }
    }
}

#Preview {
    HotelRoomView(titleName: "Лучший отель в Хургаде, Египет")
}
