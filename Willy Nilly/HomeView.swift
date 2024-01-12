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
                HorizonScrollView(titleView: "Most Picks")
                HorizonScrollView(titleView: "Hits Category")
                HorizonScrollView(titleView: "Recommend")
                HorizonScrollView(titleView: "Most Picks")
            }
            .navigationTitle("🍿 Willy Nilly")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
