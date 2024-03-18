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
//            VStack{
                HomeView()
            .tabItem { Label("Home", systemImage: "film") }
//            VStack{
                DiscoverView()
            .tabItem { Label("Discover", systemImage: "rectangle.portrait.on.rectangle.portrait.angled.fill") }

//            VStack{
                PersonView()
            .tabItem { Label("Cast", systemImage: "person.crop.rectangle.stack.fill") }
            
//            VStack{
                MyListsView()
            .tabItem { Label("Lists", systemImage: "heart.circle") }
        }
    }
}

#Preview {
    TabHome()
        .environmentObject(apiViewModel())
        .preferredColorScheme(.dark)
}
