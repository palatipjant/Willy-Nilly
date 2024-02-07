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
                    Label("Home", systemImage: "house.fill")
            }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            CategoryView()
                .tabItem {
                    Label("Category", systemImage: "books.vertical.fill")
                }
        }
        .ignoresSafeArea()
        
    }

    
    
}

#Preview {
    TabHome()
}
