//
//  PopularBanner.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 20/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct PopularBanner: View {
    
    let popmovie: [Movie]
    
    var body: some View {
        VStack(alignment: .leading){
                VStack{
                    MovieRemoteImage(urlString:
                                        "https://image.tmdb.org/t/p/w500\(popmovie.first?.poster_path ?? "/blPAS2HZcOGLTREbUeNIWmz0B6f.jpg")" )
                            .frame(maxWidth: .infinity, maxHeight: 1100)
                            .scaledToFill()
                            .background(Color(.label))
                            .ignoresSafeArea()
                    
                }
        }
    }
}

#Preview {
    PopularBanner(popmovie: [Movie(id: 790462,
                                  title: "I.S.S.",
                                  poster_path: Optional("/blPAS2HZcOGLTREbUeNIWmz0B6f.jpg"),
                                   overview: Optional("When a world war event occurs on Earth, America and Russia, both nations secretly contact their astronauts aboard the I.S.S. and give them instructions to take control of the station by any means necessary."))])
}
