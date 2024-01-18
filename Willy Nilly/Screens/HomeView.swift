//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Image("call_me_by_your_name_poster")
                    .resizable()
                    .frame(width: 280, height: 400)
                    .padding(.top, 40)
                HorizonScrollView(titleView: "Most Picks")
                HorizonScrollView(titleView: "Hits Category")
                HorizonScrollView(titleView: "Recommend")
                HorizonScrollView(titleView: "Most Picks")
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
        }
    }
}

#Preview {
    HomeView()
}
