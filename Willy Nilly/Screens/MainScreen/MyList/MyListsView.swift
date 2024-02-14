//
//  MyListsView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI
import SwiftData
import CoreData

struct MyListsView: View {
    
    @Environment(\.modelContext) var context
    @Query private var likedMovie: [LikedMovie]
    @StateObject var viewModel = apiViewModel()
    @State private var selectedCategory: String? = "Liked"
    let categories = ["Liked", "Seen"]
    
    var body: some View {
        NavigationStack{
            HStack{
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(categories[0...1], id:\.self) {category in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                                .foregroundStyle(selectedCategory == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 25)
                                .background(selectedCategory == category ? .accent : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                    }
                }.padding()
            }
            List {
                if selectedCategory == "Liked" {
                    ForEach(likedMovie) { movie in
                            HStack{
                                MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")
                                    .frame(width: 100, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                VStack(alignment: .leading){
                                    Text(movie.title)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text("Language: \(movie.original_language.uppercased())")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    Text("Release Date: \(movie.release_date)")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                }.padding(.leading)
                            }
                        
                        
                    }.onDelete { indexSet in
                        for index in indexSet{
                            context.delete(likedMovie[index])
                            try! context.save()
                        }
                    }
                } else {
                    
                }
            }.listStyle(.plain)
            .padding(.top)
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
            .navigationTitle("Lists")
        }
    }
}

#Preview {
    MyListsView()
}
