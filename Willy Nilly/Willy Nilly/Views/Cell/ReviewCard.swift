//
//  ReviewCard.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 11/2/2567 BE.
//

import SwiftUI


struct ReviewCard: View{
    
    var movie_review: [MovieReview]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Review")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(movie_review, id:\.author) { review in
                        VStack(alignment: .leading){
                            HStack{
                                MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(review.author_details.avatar_path ?? "" )" )
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading){
                                    Text(review.author)
                                        .font(.subheadline)
                                    Text(review.author_details.username)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .padding(.leading)
                            Spacer()
                                .frame(height: 20)
                            Text(review.content)
                                .multilineTextAlignment(.leading)
                                .font(.caption)
                                .lineLimit(3)
                                .padding(.horizontal)
                        }
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 140)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                .blur(radius: phase.isIdentity ? 0 : 2)
                        }
                    }
                }.padding(.leading)
                    .scrollTargetLayout()
            }.scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 20)
        }
    }
}
