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
                    Label("Discover", systemImage: "rectangle.portrait.on.rectangle.portrait.angled.fill")
                }
            Text("Cast")
                .tabItem {
                    Label("Club", systemImage: "person.crop.rectangle.stack.fill")
                }
            MyListsView()
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
