////
////  CategoryView.swift
////  Willy Nilly
////
////  Created by Palatip Jantawong on 12/1/2567 BE.
////

import SwiftUI

struct CategoryView: View {
    
    @State private var genre: [genres] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach((genre), id:\.id) {genre in
                        NavigationLink(destination: CategoryListView(genre: genre)) {
                            HStack{
                                Text(genre.name)
                                    .font(.system(size: 20))
                            }.padding(.vertical,4)
                        }
                    }
                }
                .padding(.top, 30)
                .listStyle(.plain)
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "globe.central.south.asia.fill")
                            Text("Category")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                }
            .scrollIndicators(.hidden)
            .onAppear{
                fetchGenres()
            }
        }
    }
    func fetchGenres() {
            let apiKey = "e74cd6a7de4a757ad378d3f246d73bc3"
            
            GenreNetworking.shared.fetchGenres(apiKey: apiKey) { fetchedGenres in
                genre = fetchedGenres
            }
        }
}
