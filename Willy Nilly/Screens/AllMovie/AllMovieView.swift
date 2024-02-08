//
//  AllMovieView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI

struct AllMovieView: View {
    
    var movie: [Movie]
    
    var body: some View {
        List{
            ForEach(movie) { movie in
                Text(movie.title)
            }
        }
        .navigationTitle("All")
    }
}

#Preview {
    AllMovieView(movie: Mockdata.movielist)
}
