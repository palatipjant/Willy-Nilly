//
//  SearchApi.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 24/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    
    @StateObject var viewModel = apiViewModel()
    @State var searchText = ""
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Search", text: $searchText)
                    .onSubmit {
                        viewModel.SearchMovie.removeAll()
                        viewModel.getSearch(query: searchText, page: 1)
                        viewModel.getSearch(query: searchText, page: 2)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.SearchMovie, id: \.id) {movie in
                            NavigationLink(destination: OverviewMovie(Movie: movie)) {
                                MovieRemoteImage(urlString:
                                                    "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "/blPAS2HZcOGLTREbUeNIWmz0B6f.jpg")" )
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
            .navigationTitle("Search")
        }
    }
}


