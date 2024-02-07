////
////  CategoryView.swift
////  Willy Nilly
////
////  Created by Palatip Jantawong on 12/1/2567 BE.
////

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach((viewModel.Genre), id:\.id) {genre in
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
                            Image(systemName: "books.vertical.fill")
                                .foregroundStyle(.white)
                        }
                    }
                }
            .scrollIndicators(.hidden)
            .task {
                viewModel.getGenre()
            }
        }
    }
}
