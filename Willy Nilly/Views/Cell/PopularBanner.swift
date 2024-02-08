//
//  PopularBanner.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 20/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct PopularBanner: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            if let url = viewModel.TrendingMovie.first?.posterURL {
                NavigationLink(destination: OverviewMovie(Movie: viewModel.TrendingMovie.first!)) {
                    KFImage(url)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 1100)
                        .scaledToFill()
                        .background(Color(.label))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
            }
        }
        .ignoresSafeArea()
        .task {
            viewModel.getTrendingMovie()
        }
    }
}

#Preview {
    PopularBanner()
}
