//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                PopularBanner()
                LinearGradient(colors: [.clear, .red], startPoint: .top, endPoint: .bottom)
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .offset(y: -210)
                HorizonScrollView(titleView: "New Release", movie_api: viewModel.NewMovie)
                    .offset(y: -210)
                HorizonScrollView(titleView: "Upcoming", movie_api: viewModel.NewMovie)
                    .offset(y: -210)
                HorizonScrollView(titleView: "Top in Thailand", movie_api: viewModel.NewMovie)
                    .offset(y: -210)
//                    .offset(y: -120)
            }
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            
        }
        .task {
            viewModel.getNewMovie()
        }
    }
}

#Preview {
    HomeView(viewModel: ViewModel())
}
