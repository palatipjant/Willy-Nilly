//
//  CategoryListView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 13/1/2567 BE.
//

import SwiftUI

struct CategoryListView: View {
    
    var genre: genres
    
    var body: some View {
        Text(genre.name)
            .navigationBarTitle(genre.name)
    }
    
}

