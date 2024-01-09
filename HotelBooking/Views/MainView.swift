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
                                .frame(width: abs(proxy.size.width), height: abs(proxy.size.height * 0.6))
                                .background(.white)
                                .cornerRadius(12)
                            HotelInfoFrame(descript: viewModel.hotelInfo.aboutTheHotel.description, textInfo: viewModel.hotelInfo.aboutTheHotel.peculiarities)
                                .frame(width: abs(proxy.size.width), height: abs(proxy.size.height * 0.64))
                                .background(.white)
                                .cornerRadius(12)
                            ZStack(alignment: .top){
                                Button {
                                    nav.goToHotelRoomView()
                                } label: {
                                    HBButton(title: "К выбору номера", width:  abs(proxy.size.width - 32), height: 48)
                                }
                                .frame(width: abs(proxy.size.width), height: abs(proxy.size.height * 0.12), alignment: .top)
                                .background(.white)
                            }
                        }
                        .background(Color.gray
                            .opacity(0.1))
                        .ignoresSafeArea(.all, edges: .bottom)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationDestination(for: String.self, destination: { view in
                            if view == "HotelRoomView"{
                                HotelRoomView(titleName: viewModel.hotelInfo.name)
                            } else if view == "BookingView"{
                                BookingView().toolbarRole(.editor)
                            }else if view == "FinishBookingView"{
                                FinishBookingView().toolbarRole(.editor)
                            }
                        })
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack {
                                    Text("Отель")
                                        .font(Font.custom("SFProDisplay-Regular", size: 18))
                                }
                            }
                        }
                        .toolbarBackground(.visible, for: .navigationBar)
                        .toolbarBackground(.white, for: .navigationBar)
                    }
                }
            }
            .environmentObject(nav)
        }
    }
}

