//
//  TabHome.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct TabHome: View {
    @State private var NewMovies: [NewMovie] = []
    
//    List(movies) { movie in
//        MovieRow(movie: movie)
//    }
    var body: some View {
        TabView{
            HomeView(NewMovies: NewMovies)
                .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            CategoryView()
                .tabItem {
                    Image(systemName: "globe.central.south.asia.fill")
                    Text("Category")
                }
        }
        .onAppear {
            fetchNewMovies()
        }
    }

    func fetchNewMovies() {
        NewNetworking.fetchNewMovies { result in
            switch result {
            case .success(let movies):
                self.NewMovies = movies
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}

#Preview {
    TabHome()
}
