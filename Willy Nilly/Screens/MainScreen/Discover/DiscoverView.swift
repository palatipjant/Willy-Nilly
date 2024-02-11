//
//  DiscoverView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI
import ConfettiSwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        VStack {
            Text("fee")
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}



#Preview {
    DiscoverView()
}
