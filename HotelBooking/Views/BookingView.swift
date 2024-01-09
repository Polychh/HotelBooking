//
//  Test.swift
//  HotelBooking
//
//  Created by Polina on 29.12.2023.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject var nav: NavigationStateManager
    @StateObject private var viewModel = BookingViewModel(networkManager: NetworkService())
    
    @State private var numberOfSections = 1
    @State private var username: String = ""
    @State private var name: String = ""
    @State private var surName: String = ""
    @State private var dateBirth: String = ""
    @State private var country: String = ""
    @State private var password: String = ""
    @State private var datePassword: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical){
                VStack(spacing: 0){
                    let info = viewModel.bookingInfo
                    HotelFrame(ratingName: info.ratingName, hotelName: info.hotelName, hotelAdress: info.hotelAdress, horating: info.horating)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    BookingFrame(departure: info.departure, arrivalCountry: info.arrivalCountry, tourDateStart: info.tourDateStart, tourDateStop: info.tourDateStop, numberOfNights: info.numberOfNights, hotelName: info.hotelName, room: info.room, nutrition: info.nutrition)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    InfoFrame(viewModel: viewModel)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    ForEach(0..<numberOfSections, id: \.self){ index in
                        VStack{
                            Collapsible {
                                Text("\(index + 1) турист")
                            } content: {
                                HBTextFieldStack(sectionViewModel: viewModel.sectionArray[index])
                                    .padding(.horizontal, 16)
                                    .onAppear{
                                        viewModel.indexArray.append(index)
                                    }
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    }
                    HBAddTouristButton(sumSections: $numberOfSections, viewModel: viewModel)
                        .padding(.bottom, 8)
                    CostFrame(tourPrice: info.tourPrice, fuelCharge: info.fuelCharge, serviceCharge: info.serviceCharge)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    ZStack(alignment: .top){
                        Button {
                            let turistInfo = viewModel.indexArray.allSatisfy({viewModel.sectionArray[$0].canSubmitCollapse == true })
                            if turistInfo == true && viewModel.canSubmitInfo == true {
                                nav.goFinishBookingView()
                            } else{
                                showingAlert = true
                            }
                            
                        } label: {
                            HBButton(title: "Оплатить " + String(info.fuelCharge + info.serviceCharge + info.tourPrice) + " ₽", width:  abs(proxy.size.width - 32), height: 48)
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Ошибка"), message: Text("Все поля обязательны. Пожалуйста, заполните пустые поля."), dismissButton: .default(Text("Хорошо")))
                        }
                    }
                    .frame(width: abs(proxy.size.width), height: abs(proxy.size.height * 0.12), alignment: .top)
                    .background(.white)
                }
            }
            .padding(.top, 8)
            .ignoresSafeArea(.all, edges: .bottom)
            .background(Color.gray
                .opacity(0.1))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(viewModel.bookingInfo.hotelName)
                            .font(Font.custom("SFProDisplay-Regular", size: 18))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            
        }
        .environmentObject(viewModel)
    }
}
