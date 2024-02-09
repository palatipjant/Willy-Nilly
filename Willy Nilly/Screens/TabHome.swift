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
            
            VStack{
                HomeView()
                Spacer()
            }.tabItem { Label("Home", systemImage: "film") }
            
            VStack{
                DiscoverView()
                Spacer()
            }.tabItem { Label("Discover", systemImage: "rectangle.portrait.on.rectangle.portrait.angled.fill") }

            VStack{
                ClubView()
                Spacer()
            }.tabItem { Label("Club", systemImage: "person.crop.rectangle.stack.fill") }
            
            VStack{
                MyListsView()
                Spacer()
            }.tabItem { Label("Lists", systemImage: "heart.circle") }
            
        }
        .ignoresSafeArea()
        
    }

    
    
}

#Preview {
    TabHome()
}
