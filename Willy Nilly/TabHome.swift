//
//  TabHome.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct TabHome: View {
    
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
    TabHome()
}
