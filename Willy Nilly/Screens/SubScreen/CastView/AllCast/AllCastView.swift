//
//  AllCastView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 10/2/2567 BE.
//

import SwiftUI

struct AllCastView: View{
    
    var cast: [Cast]
    var titleView: String
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(cast) {cast in
                    NavigationLink(destination: EachCastView(cast: cast)) {
                        MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(cast.profile_path ?? "")" )
                            .frame(width: 110, height: 162.91)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.45)
                                    .blur(radius: phase.isIdentity ? 0 : 5)
                            }
                            .overlay {
                                OverlayCast(cast: cast)
                            }
                    }
                    .padding(.leading,15)
                    .buttonStyle(FlatLinkStyle())
                }.padding(.vertical,10)
            }
        }
        .navigationTitle(titleView)
    }
}
