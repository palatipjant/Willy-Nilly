//
//  ContentView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 21/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    var movies = Movies()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
        }
    }
}

#Preview {
    ContentView()
}
