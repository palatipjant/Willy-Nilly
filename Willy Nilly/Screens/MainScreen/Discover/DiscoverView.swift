//
//  DiscoverView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI
import ConfettiSwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        NavigationStack{
                ZStack{
                    ForEach(viewModel.MovieDiscover) { people in
                        CardView(person: people)
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                DiscoverButton()
            
        }.task {
            viewModel.MovieDiscover.removeAll()
            viewModel.getMovieDiscover(page: 1)
            viewModel.getMovieDiscover(page: 2)
            viewModel.getMovieDiscover(page: 3)
        }
    }
}


#Preview {
    DiscoverView()
}

struct DiscoverButton: View {
    
    @State private var confetti = 0
    @State private var likeClick = false
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                print("remove")
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.red)
                            .fontWeight(.black)
                    }
            })
            
            Button(action: {
                likeClick.toggle()
                confetti += 1
                print("like")
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.green)
                            .fontWeight(.black)
                    }
            })
            .buttonStyle(LikeEffectButtonStyle(confetti: $confetti, emoji1: "❤️", emoji2: "🌹", emoji3: "🌙", emoji4: "✨"))
            
            Button(action: {
                print("return")
            }, label: {
                Circle()
                    .fill(.white)
                    .shadow(radius: 5)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "arrow.uturn.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.yellow)
                            .fontWeight(.black)
                    }
            })
        }
        .padding(.bottom,40)
        .navigationTitle("Discover")
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

