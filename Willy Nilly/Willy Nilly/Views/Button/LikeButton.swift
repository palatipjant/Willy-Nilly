//
//  LikeButton.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 10/2/2567 BE.
//

import SwiftUI
import SwiftData
import ConfettiSwiftUI

struct LikeButton: View{
    
    @EnvironmentObject var viewModel: apiViewModel
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    
    @State private var confetti = 0
    @State private var likeClick = false
    @State public var already_like = false
    
    var movie: Movie
    
    var body: some View {
        Button(action: {
            if likedMovie.contains(where: { $0.id == movie.id }) {
                if let likedMovieToDelete = likedMovie.first(where: { $0.id == movie.id }) {
                    context.delete(likedMovieToDelete)
                    try! context.save()
                }
                already_like = false
            } else {
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
                already_like = true
                confetti += 1
            }
        }, label: {
            Circle()
                .fill( already_like ? .white : .clear)
                .strokeBorder(.white, lineWidth: 1)
                .frame(width: 30, height: 30)
                .overlay {
                    Image(systemName: already_like ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(already_like ? .red : .white)
                }
                .tint(already_like ? .red : .gray)
        })
//        .buttonStyle(LikeEffectButtonStyle(confetti: $confetti, emoji1: "🎬", emoji2: "🍿", emoji3: "🍷", emoji4: "❤️"))
        .task {
            if likedMovie.contains(where: { $0.id == movie.id }) {
                already_like = true
            }
            
        }
    }
}

struct LikeEffectButtonStyle: ButtonStyle {
    
    @Binding var confetti: Int
    var emoji1: String
    var emoji2: String
    var emoji3: String
    var emoji4: String
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
            .confettiCannon(counter: $confetti,
                            confettis: [.text(emoji1 ), .text(emoji2 ), .text(emoji3 ), .text(emoji4 )],
                            confettiSize: 20,
                            radius: 220)
    }
}

