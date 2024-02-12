//
//  PopularBanner.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 20/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct PopularBanner: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading){
            if let url = movie.posterURL {
                NavigationLink(destination: OverviewMovie(movie: movie)) {
                    KFImage(url)
                        .resizable()
                        .bannerImage()
                }.buttonStyle(FlatLinkStyle())
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
