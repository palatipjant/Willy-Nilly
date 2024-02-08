////
////  CategoryView.swift
////  Willy Nilly
////
////  Created by Palatip Jantawong on 12/1/2567 BE.
////

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = apiViewModel()
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack{
            Text("Category")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading, 20)
                .padding(.bottom, 25)
            Spacer()
        }
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.Genre) { genre in
                NavigationLink(destination: CategoryListView(genre: genre)) {
                    Text(genre.name)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.leading,8)
                }
            }
        }
        .padding(.top, -20)
        .padding()
        .task {
            viewModel.getGenre()
        }
    }
}

#Preview {
    CategoryView()
}
