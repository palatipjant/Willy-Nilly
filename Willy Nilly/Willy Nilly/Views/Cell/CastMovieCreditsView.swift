//
//  CastMovieCreditsView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/2/2567 BE.
//

import SwiftUI

struct CastMovieCreditsView: View {
    
    var titleView: String
    var person_id: Int
    @EnvironmentObject var viewModel: apiViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(titleView)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                Spacer()
                NavigationLink(destination: AllMovieView(movie: viewModel.PersonMovieCredits, titleView: titleView)) {
                    Label("See All", systemImage: "arrow.right")
                        .labelStyle(TrailingIconLabelStyle())
                        .font(.footnote)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                }
            }
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(viewModel.PersonMovieCredits) {movie in
                        NavigationLink(destination: OverviewMovie(movie: movie)) {
                            MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")" )
                                .frame(width: 110, height: 162.91)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.45)
                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                }
                                .contextMenu {
                                    ContextMenuMovieCell(movie: movie)
                                }
                        }.buttonStyle(FlatLinkStyle())
                    }
                    .padding(.leading,15)
                }
                .frame(height: 180)
                .scrollTargetLayout()
            }
            .padding(.top, -10)
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 10)
        }
        .task {
            viewModel.getPersonMovieCredits(person_id: person_id)
        }
    }
}

#Preview {
    CastMovieCreditsView(titleView: "testse", person_id: 12799)
        .environment(apiViewModel())
        .preferredColorScheme(.dark)
}
