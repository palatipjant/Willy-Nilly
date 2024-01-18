//
//  TabHome.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct TabHome: View {
    @State private var movies: [Movie] = []

    var body: some View {
        NavigationView {
            List(movies) { movie in
                MovieRow(movie: movie)
            }
            .navigationTitle("New Movies")
        }
        .onAppear {
            fetchMovies()
        }
    }

    func fetchMovies() {
        Networking.fetchMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies
                for movie in movies {
                    print("Movie: \(movie.title), Poster Path: \(movie.posterPath ?? "N/A")")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

    //
//    var body: some View {
//        TabView{
//            HomeView()
//                .tabItem {
//                Image(systemName: "house.fill")
//                Text("Home")
//            }
//            CategoryView()
//                .tabItem {
//                    Image(systemName: "globe.central.south.asia.fill")
//                    Text("Category")
//                }
//        }
//    }
//}

#Preview {
    TabHome()
}
