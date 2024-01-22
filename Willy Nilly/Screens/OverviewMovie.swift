//
//  OverviewMovie.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 22/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct OverviewMovie: View {
    var NewMovie: NewMovie
    var body: some View {
        VStack{
            if let url = NewMovie.posterURL {
                KFImage(url)
                    .resizable()
                    .frame(width: 230, height: 300)
                    .scaledToFit()
                    .background(Color(.label))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            Text(NewMovie.title)
                .fontWeight(.bold)
                .font(.largeTitle)
            Spacer()
        }
    }
}

#Preview {
    OverviewMovie(NewMovie: NewMovie(id: 321, title: "fee", poster_path: "/vdpE5pjJVql5aD6pnzRqlFmgxXf.jpg"))
}
