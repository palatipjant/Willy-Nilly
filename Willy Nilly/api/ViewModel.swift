//
//  ViewModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import SwiftUI

@MainActor final class AppetizerListViewMedel: ObservableObject {
    
    @Published var appetizers: [NewMovie1] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    @Published var isShowingDetail = false
    @Published var appetizer_card: NewMovie1?

    func getAppetizers() {
        isLoading = true
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch{
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
}
