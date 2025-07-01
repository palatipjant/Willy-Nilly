//
//  SearchApi.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 24/1/2567 BE.
//

import SwiftUI

struct SearchView: View {
    
    enum FocusedField {
        case search
    }
    
    @EnvironmentObject var viewModel: apiViewModel
    @State var searchText = ""
    @FocusState var isFocus: FocusedField?
    @Binding var isinSearch: Bool
    
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
                    viewModel.getSearch(query: searchText, page: 3)
                }
                .focused($isFocus, equals: .search)
                .textFieldStyle(.roundedBorder)
                .padding()
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.SearchMovie) {movie in
                        NavigationLink(destination: OverviewMovie(movie: movie)) {
                            MovieRemoteImage(urlString:
                                                "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                            .frame(width: 110, height: 162.91)
                            .scaledToFill()
                            .background(Color(.label))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .contextMenu {
                                ContextMenuMovieCell(movie: movie)
                            }
                        }
                        .buttonStyle(FlatLinkStyle())
                    }.padding(.vertical,10)
                }
            }
            .scrollIndicators(.hidden)
            .overlay {
                if viewModel.SearchMovie.isEmpty {
                    VStack(spacing: 20){
                        Image("no-result")
                            .resizable()
                            .frame(width: 231, height: 190.86)
                            .padding()
                        Spacer()
                    }
                    .opacity(0.7)
                    .padding(.top, 100)
                }
            }
        }
        .navigationTitle("Search")
        .onAppear(perform: {
            viewModel.SearchMovie.removeAll()
            isFocus = .search
        })
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
        
    }
}


