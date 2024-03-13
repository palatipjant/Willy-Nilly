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
    @Query private var likedMovie: [SaveLists]
    @Query private var seenMovie: [SaveLists]
    
    @EnvironmentObject var viewModel: apiViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(likedMovie.filter{ $0.tag == "Liked" }) { movie in
                    NavigationLink(destination: OverviewMovie(movie: Movie(id: movie.id,
                                                                           title: movie.title,
                                                                           overview: movie.overview,
                                                                           release_date: movie.release_date,
                                                                           original_language: movie.original_language,
                                                                           genre_ids: movie.genre_ids,
                                                                           poster_path: movie.poster_path))) {
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
                    }
                    
                }.onDelete { indexSet in
                    for index in indexSet{
                        context.delete(likedMovie[index])
                        try! context.save()
                    }
                }
            }.listStyle(.plain)
                .padding(.top)
                .alert(item: $viewModel.alertItem) { alert in
                    Alert(title: alert.title,
                          message: alert.message,
                          dismissButton: alert.dismissButton)
                }
                .navigationTitle("Liked Movies")
        }
    }
}

#Preview {
    MyListsView()
        .environment(apiViewModel())
        .preferredColorScheme(.dark)
}
