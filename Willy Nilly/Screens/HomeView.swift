//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @State private var NewMovies: [NewMovie] = []
    var body: some View {
        NavigationStack{
            ScrollView{
                PoppularBanner()
                HorizonScrollView(titleView: "New Release", movie_api: NewMovies)
//                HorizonScrollView(titleView: "Hits Category", movie_api: NewMovies)
//                HorizonScrollView(titleView: "Recommend", movie_api: NewMovies)
//                HorizonScrollView(titleView: "Most Picks", movie_api: NewMovies)
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "popcorn.fill")
                            Text("Willy Nilly")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                }
            .scrollIndicators(.hidden)
            
        }.onAppear {
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
//
//#Preview {
//    HomeView(NewMovies: [NewMovie(id: 753342, title: "dssa", poster_path: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg")], PopMovies: [PopMovie(id: 753342, title: "dssa", posterPath: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg", overview: "Fee test api", mediaType: "TV")])
//}
