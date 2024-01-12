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
                HorizonScrollView(titleView: "Most Picks", posterName: "call_me_by_your_name_poster")
                HorizonScrollView(titleView: "Hits Category", posterName: "call_me_by_your_name_poster")
                HorizonScrollView(titleView: "Recommend", posterName: "call_me_by_your_name_poster")
                HorizonScrollView(titleView: "Most Picks", posterName: "call_me_by_your_name_poster")
            }
            .navigationTitle("🍿 Willy Nilly")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
