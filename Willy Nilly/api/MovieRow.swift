//
//  MovieRow.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 18/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let url = movie.posterURL {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 75) // Adjust the size as needed
                    .cornerRadius(5)
            } else {
                Image(systemName: "photo") // Placeholder for missing poster
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 75)
                    .cornerRadius(5)
            }

            Text(movie.title)
        }
    }
}

#Preview {
    MovieRow(movie: Movie(id: 753342, title: "Napoleon", posterPath: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg"))
}
