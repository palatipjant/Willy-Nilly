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
    var movie_api: [NewMovie]
    
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
                            if let url = movie.posterURL {
                                NavigationLink(destination: OverviewMovie(NewMovie: movie)) {
                                    KFImage(url)
                                        .resizable()
                                        .frame(width: 110, height: 162.91)
                                        .scaledToFit()
                                        .background(Color(.label))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
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

#Preview {
    HorizonScrollView(titleView: "Most Picks", movie_api: [NewMovie(id: 753342, title: "dssa", poster_path: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg")])
}
