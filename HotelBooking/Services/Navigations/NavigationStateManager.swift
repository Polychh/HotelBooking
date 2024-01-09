//
//  NavigationStateManager.swift
//  HotelBooking
//
//  Created by Polina on 31.12.2023.
//

import SwiftUI
class NavigationStateManager: ObservableObject {
    @Published var selectionPath = NavigationPath()
    
    func popToRoot() {
        selectionPath = NavigationPath()
    }
    func goToHotelRoomView() {
        selectionPath.append("HotelRoomView")
    }
    func goToBookingView() {
        selectionPath.append("BookingView")
    }
    
    func goFinishBookingView() {
        selectionPath.append("FinishBookingView")
    }
}
