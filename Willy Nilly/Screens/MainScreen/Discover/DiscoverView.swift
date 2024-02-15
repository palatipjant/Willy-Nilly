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
    @Query private var likedMovie: [SaveLists]
    
    var body: some View {
        NavigationStack{
            ZStack{
                ForEach(viewModel.MovieDiscover.shuffled()) { movie in
                    if !likedMovie.contains(where: { $0.id == movie.id }) {
                        VStack{
                            NavigationLink(destination: OverviewMovie(movie: movie)){
                                CardView(movie: movie)
                            }
                            .buttonStyle(FlatLinkStyle())
                            Spacer()
                            
                            DiscoverButton(movie: movie)
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
            
        }
    }
}

#Preview {
    DiscoverView()
}

struct DiscoverButton: View {
    
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    @StateObject var viewModel = apiViewModel()
    @State private var confetti = 0
    @State private var likeClick = false
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 15) {
//            Button(action: {
//                viewModel.removeMovieFromDiscover(withId: movie.id)
//            }, label: {
//                Circle()
//                    .fill(.white)
//                    .shadow(radius: 5)
//                    .frame(width: 50, height: 50)
//                    .overlay {
//                        Image(systemName: "xmark")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .foregroundStyle(.red)
//                            .fontWeight(.black)
//                    }
//            })
            
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
            
//            Button(action: {
//                //
//            }, label: {
//                Circle()
//                    .fill(.white)
//                    .shadow(radius: 5)
//                    .frame(width: 50, height: 50)
//                    .overlay {
//                        Image(systemName: "eye.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .foregroundStyle(.black)
//                            .fontWeight(.black)
//                    }
//            })
        }
        .padding(.bottom,40)
    }
}

