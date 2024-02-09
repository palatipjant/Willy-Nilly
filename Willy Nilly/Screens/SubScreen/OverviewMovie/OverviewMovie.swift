//
//  OverviewMovie.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 22/1/2567 BE.
//

import SwiftUI
import Kingfisher
import ConfettiSwiftUI

struct OverviewMovie: View {
    
    @State private var confetti = 0
    var Movie: Movie
    
    var body: some View {
        GeometryReader{_ in
            ScrollView{
                VStack{
                    MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(Movie.poster_path ?? "")" )
                        .bannerImage()
                        .overlay(content: { LinearPoster() })
                        .background(ScrollViewConfigurator { $0?.bounces = false })
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text(Movie.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                        Text(Movie.overview ?? "Overview Error. Please Try again later." )
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                            .multilineTextAlignment(.leading)
                        Button {
                            confetti += 1
                        } label: {
                            Label("Like", systemImage: "heart.fill")
                        }
                        .confettiCannon(counter: $confetti, confettis: [.text("🎬"), .text("🍿"), .text("🍷"), .text("❤️")], confettiSize: 20)
                        .padding(.leading)
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: -150)
                }
                
            }
            .scrollIndicators(.hidden)
            //                .navigationTitle(Movie.title)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OverviewMovie(Movie: Mockdata.sampledata)
}
