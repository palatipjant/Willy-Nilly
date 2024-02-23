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
    
    @EnvironmentObject var viewModel: apiViewModel
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    var body: some View {
        NavigationStack{
            ZStack{
                ForEach(viewModel.MovieDiscover.shuffled().prefix(1)) { movie in
                        if !likedMovie.contains(where: { $0.id == movie.id }) {
                            ZStack{
                                VStack{
                                    NavigationLink(destination: OverviewMovie(movie: movie)){
                                        CardView(movie: movie)
                                            .ignoresSafeArea(edges: .bottom)
                                    }
                                    .buttonStyle(FlatLinkStyle())
                                    .overlay(content: {
                                        VStack{
                                            LinearGradient(colors: [.clear, .black], startPoint: .bottom, endPoint: .top)
                                                .frame(maxWidth: .infinity, maxHeight: 140)
                                                .offset(y: -20)
                                            Spacer()
                                            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                                                .frame(maxWidth: .infinity, maxHeight: 190)
                                                .offset(y: 20)
                                        }
                                    })
                                }
                                VStack{
                                    Spacer()
                                    DiscoverButton(movie: movie)
                                }
                            }
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
            
            
            
        }.onAppear {
            viewModel.MovieDiscover.removeAll()
            viewModel.getMovieDiscover(page: 1)
            viewModel.getMovieDiscover(page: 2)
            viewModel.getMovieDiscover(page: 3)
            viewModel.getMovieDiscover(page: 4)
            viewModel.getMovieDiscover(page: 5)
            
        }
    }
}

#Preview {
    DiscoverView()
}

struct DiscoverButton: View {
    
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    @EnvironmentObject var viewModel: apiViewModel
    @State private var confetti = 0
    @State private var likeClick = false
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                likeClick.toggle()
                confetti += 1
                let LikedMovie = SaveLists(id: movie.id,
                                           title: movie.title,
                                           overview: movie.overview,
                                           release_date: movie.release_date,
                                           original_language: movie.original_language,
                                           genre_ids: movie.genre_ids,
                                           poster_path: movie.poster_path,
                                           posterURL: movie.posterURL,
                                           tag: "Liked")
                context.insert(LikedMovie)
                try! context.save()
                viewModel.removeMovieFromDiscover(withId: movie.id)
            }, label: {
                Circle()
                    .fill(.clear)
                    .strokeBorder(.white, lineWidth: 1)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                            .fontWeight(.black)
                    }
            })
            .buttonStyle(LikeEffectButtonStyle(confetti: $confetti, emoji1: "❤️", emoji2: "🌹", emoji3: "🌙", emoji4: "✨"))
        }
        .padding(.bottom,40)
    }
}

