//
//  PopularBanner.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 20/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct PopularBanner: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
                VStack{
                    if let url = viewModel.PopMovie.first?.posterURL {
                            KFImage(url)
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 1100)
                                .scaledToFill()
                                .background(Color(.label))
                                .ignoresSafeArea()
                        }
                    
                }
        }
        .onAppear{
            viewModel.getPopMovie()
        }
    }
}

#Preview {
    PopularBanner()
}
