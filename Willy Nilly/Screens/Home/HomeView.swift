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
                HorizonScrollView(titleView: "New Release", movie_api: viewModel.NewMovie)
                    .offset(y: -160)
                HorizonScrollView(titleView: "Upcoming", movie_api: viewModel.NewMovie)
                    .offset(y: -160)
                HorizonScrollView(titleView: "Top in Thailand", movie_api: viewModel.NewMovie)
                    .offset(y: -160)
            }
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            NavigationLink(destination: SearchView()) {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                                    .foregroundStyle(Color(.white))
                                    .padding(.trailing)
                            }
                        }
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
        }
        .task {
            viewModel.getNewMovie()
        }
    }
}

#Preview {
    HomeView(viewModel: apiViewModel())
}
