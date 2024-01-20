//
//  PoppularBanner.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 20/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct PoppularBanner: View {
    
    @State private var PoppularMovie: [PopMovie] = []
    
    var body: some View {
        VStack(alignment: .leading){
                VStack{
                        if let url = PoppularMovie.first?.posterURL {
                            KFImage(url)
                                .resizable()
                                .frame(width: 320, height: 450)
                                .scaledToFit()
                                .background(Color(.label))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                }
        }
            .padding(.top, 20)
            .onAppear{
                fetchPopMovies()
            }
    }
    func fetchPopMovies() {
        PopMovieNetworking.fetchPopMovie { result in
            switch result {
            case .success(let Popmovies):
                self.PoppularMovie = Popmovies
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    PoppularBanner()
}
