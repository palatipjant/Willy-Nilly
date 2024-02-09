//
//  OverviewMovie.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 22/1/2567 BE.
//

import SwiftUI
import Kingfisher
import ConfettiSwiftUI

struct OverviewMovie: View {
    
    @State var isRead = false
    var Movie: Movie
    
    var body: some View {
        ZStack(alignment: .bottom){
            GeometryReader{_ in
                ScrollView{
                    VStack{
                        MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(Movie.poster_path ?? "")" )
                            .bannerImage()
                            .overlay(content: { LinearPoster() })
                            .background(ScrollViewConfigurator { $0?.bounces = false })
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text(Movie.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(Movie.overview!)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(isRead ? 20 : 3)
                                Button(isRead ? "Read Less" : "Read More" ) {
                                    isRead.toggle()
                                }
                            }
                            .font(.system(size: 16, weight: .regular))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                            .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity)
                        .offset(y: -150)
                    }
                    
                }
                .scrollIndicators(.hidden)
                .toolbarBackground(.hidden, for: .navigationBar)
            }
            HStack{
                LikeButton()
                MarkAsSeenButton()
            }.padding(.bottom,15)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    OverviewMovie(Movie: Mockdata.sampledata)
}
