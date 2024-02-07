//
//  TabHome.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct TabHome: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "film")
            }
            Text("Discover")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            CategoryView()
                .tabItem {
                    Label("Category", systemImage: "books.vertical.fill")
                }
            Text("Lists")
                .tabItem {
                    Label("Lists", systemImage: "heart.circle")
                }
        }
        .ignoresSafeArea()
        
    }

    
    
}

#Preview {
    TabHome()
}
