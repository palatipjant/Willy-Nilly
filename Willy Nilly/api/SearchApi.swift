//
//  SearchApi.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 24/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State var searchText = ""
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        VStack {
            TextField("Search movies", text: $searchText)
                .onSubmit {
                    viewModel.searchMovies(query: searchText)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
//            List(viewModel.movies, id: \.id) { movie in
//                Text(movie.title)
//            }
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.id) {movie in
                        if let url = movie.posterURL {
                            KFImage(url)
                                .resizable()
                                .frame(width: 110, height: 162.91)
                                .scaledToFill()
                                .background(Color(.label))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }.padding(.vertical,10)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}


