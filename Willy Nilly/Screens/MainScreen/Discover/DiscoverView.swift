//
//  DiscoverView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI
import SwiftData
import ConfettiSwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = apiViewModel()
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [LikedMovie]
    
    var body: some View {
        NavigationStack{
            ZStack{
                ForEach(viewModel.MovieDiscover.shuffled()) { movie in
                    if !likedMovie.contains(where: { $0.id == movie.id }) {
                        NavigationLink(destination: OverviewMovie(movie: movie)){
                            CardView(movie: movie)
                        }
                        .buttonStyle(FlatLinkStyle())
                    }
                    else {
                        EmptyView()
                            .onAppear{
                                viewModel.removeMovieFromDiscover(withId: movie.id)
                            }
                    }
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Discover")
            .toolbarBackground(.hidden, for: .navigationBar)
            
            DiscoverButton()
            
        }.task {
            if !viewModel.isMovieDiscoverLoaded {
                viewModel.MovieDiscover.removeAll()
                viewModel.getMovieDiscover(page: 1)
                viewModel.getMovieDiscover(page: 2)
                viewModel.getMovieDiscover(page: 3)
                viewModel.isMovieDiscoverLoaded = true
            }
        }
    }
}

#Preview {
    DiscoverView()
}

struct DiscoverButton: View {
    
    @StateObject var viewModel = apiViewModel()
    @State private var confetti = 0
    @State private var likeClick = false
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                print("remove")
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.red)
                            .fontWeight(.black)
                    }
            })
            
            Button(action: {
                likeClick.toggle()
                confetti += 1
                print("like")
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.green)
                            .fontWeight(.black)
                    }
            })
            .buttonStyle(LikeEffectButtonStyle(confetti: $confetti, emoji1: "❤️", emoji2: "🌹", emoji3: "🌙", emoji4: "✨"))
            
            Button(action: {
                //
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "eye.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.black)
                            .fontWeight(.black)
                    }
            })
        }
        .padding(.bottom,40)
    }
}

