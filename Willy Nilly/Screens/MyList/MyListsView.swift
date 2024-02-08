//
//  MyListsView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI

struct MyListsView: View {
    
    @State var fee = ""
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Fee", text: $fee)
                } header: {
                    Text("Create Lists")
                }

            }
            .navigationTitle("My Lists")
        }
    }
}

#Preview {
    MyListsView()
}
