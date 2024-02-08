//
//  OverviewMovie.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 22/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct OverviewMovie: View {
    
    var Movie: Movie
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(Movie.poster_path ?? "")" )
                        .frame(maxWidth: .infinity, maxHeight: 1100)
                        .scaledToFit()
                        .background(Color(.label))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .background(ScrollViewConfigurator {
                            $0?.bounces = false
                        })
                    LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .offset(y: -155)
                    VStack(alignment: .leading, spacing: 20){
                        Text(Movie.overview ?? "Overview Error. Please Try again later." )
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .onTapGesture {
                                //
                            }
                    }.frame(maxWidth: .infinity)
                        .offset(y: -155)
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle(Movie.title)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .ignoresSafeArea()
    }
}