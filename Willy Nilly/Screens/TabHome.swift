//
//  TabHome.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI

struct TabHome: View {
    
    
//    List(movies) { movie in
//        MovieRow(movie: movie)
//    }
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            CategoryView()
                .tabItem {
                    Image(systemName: "globe.central.south.asia.fill")
                    Text("Category")
                }
        }
        
    }

    
    
}

#Preview {
    TabHome()
}
