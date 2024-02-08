//
//  HorizonScrollView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import Foundation
import SwiftUI
import Kingfisher

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
                    .padding(.bottom, 25)
                Spacer()
                NavigationLink(destination: AllMovieView(movie: movie_api, titleView: titleView)) {
                    Label("See All", systemImage: "arrow.right")
                        .labelStyle(TrailingIconLabelStyle())
                        .font(.footnote)
                        .padding(.trailing, 20)
                        .padding(.bottom, 25)
                        .padding(.top, 10)
                }
            }
            ScrollView(.horizontal) {
                HStack{
                    ForEach(movie_api, id: \.id) {movie in
                        NavigationLink(destination: OverviewMovie(Movie: movie)) {
                            MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                                .frame(width: 110, height: 162.91)
                                .scaledToFit()
                                .background(Color(.label))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.45)
                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                }
                                .contextMenu {
                                    Button {
                                        print("dummy")
                                    } label: {
                                        Label("Overview", systemImage: "doc.plaintext.fill")
                                    }
                                    Button {
                                        print("dummy")
                                    } label: {
                                        Label("Like", systemImage: "heart.fill")
                                    }
                                    Button {
                                        print("dummy")
                                    } label: {
                                        Label("Mark as seen", systemImage: "eye.fill")
                                    }
                                }
                        }.buttonStyle(FlatLinkStyle())
                    }
                    .padding(.leading,20)
                }
            }
            .padding(.top, -20)
        }
        .padding(.top, 20)
    }
}
//
//#Preview {
//    HorizonScrollView(titleView: "Test Horizontal", movie_api: [Movie(id: 866398, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")])
//}
//
