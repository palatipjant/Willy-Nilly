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
            Text(titleView)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading, 20)
                .padding(.bottom, 25)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(movie_api, id: \.id) {movie in
                        NavigationLink(destination: OverviewMovie(Movie: movie)) {
                            MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                                .frame(width: 110, height: 162.91)
                                .scaledToFit()
                                .background(Color(.label))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.65)
                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                }
                        }
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
//    HorizonScrollView(titleView: "Most Picks", movie_api: [Movie(id: 753342, title: "dssa", poster_path: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg", overview: "Mock Data Overview")])
//}
