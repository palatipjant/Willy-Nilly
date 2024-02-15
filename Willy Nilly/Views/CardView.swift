//
//  CardView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 11/2/2567 BE.
//

import SwiftUI
import SwiftData

struct CardView: View {
    
    var movie: Movie
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [SaveLists]
    
    @StateObject private var viewModel = apiViewModel()
    @State public var offset = CGSize.zero
    @State private var color: Color = .clear
    
    var body: some View {
        ZStack{
            VStack{
                MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                    .frame(width: 320, height: 460)
                    .scaledToFill()
                    .shadow(radius: 4)
                    .overlay(content: {
                        Rectangle()
                            .frame(width: 320, height: 460)
                            .foregroundStyle(color)
                            .opacity(0.5)
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .offset(x: offset.width, y: offset.height * 0.4)
                    .rotationEffect(.degrees(Double(offset.width / 40)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            } .onEnded { _ in
                                withAnimation {
                                    swipeCard(width: offset.width)
                                }
                            }
                    )
            }
        }
    }
    func swipeCard(width: CGFloat) {
        switch width{
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            viewModel.removeMovieFromDiscover(withId: movie.id)
        case 150...500:
            offset = CGSize(width: 500, height: 0)
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
        default:
            offset = CGSize.zero
        }
    }
    
//    func changeColor(width: CGFloat) {
//        switch width{
//        case -500...(-140):
//            color = .red
//        case 130...500:
//            color = .green
//        default:
//            color = .clear
//        }
//    }
}

#Preview {
    CardView(movie: Mockdata.sampledata)
}
