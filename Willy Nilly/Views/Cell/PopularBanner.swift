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
                NavigationLink(destination: OverviewMovie(movie: viewModel.TrendingMovie.first!)) {
                    KFImage(url)
                        .resizable()
                        .bannerImage()
                }.buttonStyle(FlatLinkStyle())
            }
        }
        .ignoresSafeArea(edges: .top)
        .task {
            viewModel.getTrendingMovie()
        }
    }
}

#Preview {
    PopularBanner()
}
