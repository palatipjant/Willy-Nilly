//
//  HorizonScrollView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct HorizonScrollView: View {
    
    var titleView: String
    var movie_api: [Movie]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(titleView)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
//                    .padding(.bottom, 25)
                Spacer()
                NavigationLink(destination: AllMovieView(movie: movie_api, titleView: titleView)) {
                    Label("See All", systemImage: "arrow.right")
                        .labelStyle(TrailingIconLabelStyle())
                        .font(.footnote)
                        .padding(.trailing, 20)
//                        .padding(.bottom, 25)
                        .padding(.top, 10)
                }
            }
            ScrollView(.horizontal) {
                HStack{
                    ForEach(movie_api) {movie in
                        NavigationLink(destination: OverviewMovie(movie: movie)) {
                            MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                                .frame(width: 110, height: 162.91)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.45)
                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                }
                                .contextMenu {
                                    ContextMenuMovieCell(movie: movie)
                                }
                        }.buttonStyle(FlatLinkStyle())
                    }
                    .padding(.leading,15)
                }
                .frame(height: 180)
            }
            .padding(.top, -10)
        }
    }
}

#Preview {
    HorizonScrollView(titleView: "testse", movie_api: Mockdata.movielist)
}
