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
    
    @State private var numberOfSections = ConstBooking.defaultSection
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
                VStack(spacing: 8){
                    let info = viewModel.bookingInfo
                    HotelFrame(ratingName: info.ratingName, hotelName: info.hotelName, hotelAdress: info.hotelAdress, horating: info.horating)
                        .background(.white)
                        .cornerRadius(12)
                    BookingFrame(departure: info.departure, arrivalCountry: info.arrivalCountry, tourDateStart: info.tourDateStart, tourDateStop: info.tourDateStop, numberOfNights: info.numberOfNights, hotelName: info.hotelName, room: info.room, nutrition: info.nutrition)
                        .background(.white)
                        .cornerRadius(12)
                    InfoFrame(viewModel: viewModel)
                        .background(.white)
                        .cornerRadius(12)
                    ForEach(0..<numberOfSections, id: \.self){ index in
                        VStack(spacing: 0){
                            Collapsible {
                                Text(convertIndexTourist(number: index) + ConstBooking.toutist)
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
                    }
                    HBAddTouristButton(sumSections: $numberOfSections, viewModel: viewModel)
                    CostFrame(tourPrice: info.tourPrice, fuelCharge: info.fuelCharge, serviceCharge: info.serviceCharge)
                        .background(.white)
                        .cornerRadius(12)
                    ZStack(alignment: .top){
                        Button {
                            let turistInfo = viewModel.indexArray.allSatisfy({viewModel.sectionArray[$0].canSubmitCollapse == true })
                            if turistInfo == true && viewModel.canSubmitInfo == true {
                                nav.goFinishBookingView()
                            } else{
                                viewModel.indexArray.forEach { index in
                                    viewModel.sectionArray[index].buttonTapped = true
                                    viewModel.sectionArray[index].triggerTextFieldValidation()
                                }
                                viewModel.buttonTapped = true
                                viewModel.triggerTFInfoValidation()
                                showingAlert = true
                            }
                        } label: {
                            HBButton(title: ConstBooking.pay + formated(valueInt: info.fuelCharge + info.serviceCharge + info.tourPrice)  + ConstMain.space + ConstMain.rub, width:  abs(proxy.size.width - 32), height: 48)
                                .padding(.top, 12)
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(ConstBooking.alerTitle), message: Text(ConstBooking.alertMessage), dismissButton: .default(Text(ConstBooking.alertButTitle)))
                        }
                    }
                    .frame(width: abs(proxy.size.width), height: 88, alignment: .top)
                    .background(.white)
                }
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .padding(.top, 8)
            .ignoresSafeArea(.all, edges: .bottom)
            .background(ConstMain.backColor)
            .navigationBarTitleDisplayMode(.inline)
            .navBarCustomMod(with: ConstBooking.navTitle)
        }
        .environmentObject(viewModel)
    }
}
