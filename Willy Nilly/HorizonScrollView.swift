//
//  HorizonScrollView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import Foundation
import SwiftUI

struct HorizonScrollView: View {
    
    var movies = Movies()
    var titleView: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(titleView)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading, 20)
                .padding(.bottom, 25)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(movies.movie_mostpick, id: \.id) {movie in
                        Image(movie.posterName)
                            .resizable()
                            .frame(width: 110, height: 162.91)
                            .scaledToFit()
                            .background(Color(.label))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }.padding(.leading,20)
                }
            }.padding(.top, -20)
        }.padding(.top, 25)
    }
}

#Preview {
    HorizonScrollView(movies: Movies(), titleView: "Most Picks")
}
