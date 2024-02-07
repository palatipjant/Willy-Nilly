//
//  SearchApi.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 24/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var searchText = ""
    
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
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


