//
//  CategoryView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct CategoryView: View {
    
    var genres = Genres()
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach((genres.all_genres), id:\.self) {genre in
                        NavigationLink(destination: CategoryListView(genre: genre)) {
                            HStack{
                                Text(genre.genreName)
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
                
        }
    }
}

#Preview {
    CategoryView()
}
