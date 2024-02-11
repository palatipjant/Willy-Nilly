//
//  MyListsView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI
import CoreData

struct MyListsView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
        }
        .ignoresSafeArea()
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    MyListsView()
}
