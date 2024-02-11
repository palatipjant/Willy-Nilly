//
//  ClubView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI

struct ClubView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        ZStack{
            Color(.yellow)
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    ClubView()
}
