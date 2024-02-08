//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                PopularBanner()
                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                    .frame(maxWidth: .infinity, minHeight: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .offset(y: -155)
                HorizonScrollView(titleView: "Trending", movie_api: viewModel.TrendingMovie)
                    .offset(y: -160)
                HorizonScrollView(titleView: "Upcoming", movie_api: viewModel.UpcomingMovie)
                    .offset(y: -160)
                HorizonScrollView(titleView: "Top Rated", movie_api: viewModel.TopRatedMovie)
                    .offset(y: -160)
                HorizonScrollView(titleView: "Now Playing", movie_api: viewModel.NowPlaying)
                    .offset(y: -160)
            }
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        SearchButtonView()
                            .opacity(0.7)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Home")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
        }
        .task {
            viewModel.getUpcomingMovie()
            viewModel.getTrendingMovie()
            viewModel.getTopRated()
            viewModel.getNowPlaying()
        }
    }
}

#Preview {
    HomeView(viewModel: apiViewModel())
}

struct SearchButtonView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: SearchView()) {
                HStack{
                    Capsule()
                        .fill(.blendMode(.multiply))
                        .strokeBorder(.white, lineWidth: 2)
                        .frame(width: 90, height: 35)
                        .foregroundStyle(.gray)
                        .overlay {
                            Text("Search")
                                .foregroundStyle(.white)
                        }
                }
            }
        }
    }
}
