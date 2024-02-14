//
//  MarkAsSeenButton.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 10/2/2567 BE.
//

import SwiftUI
import ConfettiSwiftUI
import SwiftData

struct MarkAsSeenButton: View{
    
    @State private var confetti = 0
    @State private var likeClick = false
    @State private var already_seen = false
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    
    var movie: Movie
    
    var body: some View {
        Button(action: {
            if likedMovie.contains(where: { $0.id == movie.id }) {
                if let likedMovieToDelete = likedMovie.first(where: { $0.id == movie.id }) {
                    context.delete(likedMovieToDelete)
                    try! context.save()
                }
                already_seen = false
            } else {
                let LikedMovie = SaveLists(id: movie.id,
                                            title: movie.title,
                                            overview: movie.overview,
                                            release_date: movie.release_date,
                                            original_language: movie.original_language,
                                            genre_ids: movie.genre_ids,
                                            poster_path: movie.poster_path,
                                            posterURL: movie.posterURL,
                                            tag: "Seen")
                context.insert(LikedMovie)
                try! context.save()
                already_seen = true
                confetti += 1
            }
        }, label: {
            Circle()
                .fill(.white)
                .shadow(radius: 5)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: already_seen ? "eye.fill" : "eye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(already_seen ? .black : .black)
                }
                .tint(already_seen ? .black : .black)
        })
        .buttonStyle(MarkAsSeenEffectButtonStyle(confetti: $confetti))
    }
}

struct MarkAsSeenEffectButtonStyle: ButtonStyle {
    
    @Binding var confetti: Int
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
            .confettiCannon(counter: $confetti,
                            confettis: [.text("👀"), .text("🍿"), .text("📺"), .text("🎉")],
                            confettiSize: 20,
                            radius: 220)
    }
}


