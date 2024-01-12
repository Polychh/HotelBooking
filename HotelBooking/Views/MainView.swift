//
//  MainView.swift
//  HotelBooking
//
//  Created by Polina on 24.12.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel(networkManager: NetworkService())
    @StateObject var nav = NavigationStateManager()
    
    var body: some View {
        if viewModel.loading {
            NavigationStack(path: $nav.selectionPath) {
                GeometryReader { proxy in
                    ScrollView{
                        VStack{
                            SliderFhotoFrame(name: viewModel.hotelInfo.name, mark: viewModel.hotelInfo.rating, rateName: viewModel.hotelInfo.ratingName, adress: viewModel.hotelInfo.adress, price: viewModel.hotelInfo.minimalPrice, pricefor: viewModel.hotelInfo.priceForIt, images: viewModel.hotelInfo.imageUrls)
                                .background(.white)
                                .cornerRadius(12)
                            HotelInfoFrame(descript: viewModel.hotelInfo.aboutTheHotel.description, textInfo: viewModel.hotelInfo.aboutTheHotel.peculiarities)
                                .background(.white)
                                .cornerRadius(12)
                            ZStack(alignment: .top){
                                Button {
                                    nav.goToHotelRoomView()
                                } label: {
                                    HBButton(title: ConstMain.titleButton, width:  abs(proxy.size.width - 32), height: 48)
                                        .padding(.top, 12)
                                }
                                .frame(width: abs(proxy.size.width), height: 88, alignment: .top)
                                .background(.white)
                            }
                        }
                    }
                    .background(ConstMain.backColor)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: String.self, destination: { view in
                        if view == ConstMain.destHotelRoomView{
                            HotelRoomView(titleName: viewModel.hotelInfo.name)
                        } else if view == ConstMain.destBookingView{
                            BookingView().toolbarRole(.editor)
                        }else if view == ConstMain.destFinBookingView{
                            FinishBookingView().toolbarRole(.editor)
                        }
                    })
                    .navBarCustomMod()
                }
            }
            .accentColor(.black)
            .environmentObject(nav)
        }
    }
}

