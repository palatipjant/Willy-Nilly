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
    
    var body: some View {
        NavigationStack{
            ZStack{
                List{
                    ForEach(likedMovie) { movie in
                        Text(movie.title)
                    }.onDelete { indexSet in
                        for index in indexSet{
                            context.delete(likedMovie[index])
                        }
                    }
                }
            }
            .navigationTitle("Lists")
        }
        .ignoresSafeArea()
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    MyListsView()
}
