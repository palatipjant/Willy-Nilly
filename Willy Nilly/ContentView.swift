//
//  ContentView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 21/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text(" ")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            }.navigationTitle("Willy Nilly 👋🏻")
                .frame(width: 500, height: 500)
                .background(.black)
        }
    }
}

#Preview {
    ContentView()
}
