//
//  CategoryListView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 13/1/2567 BE.
//

import SwiftUI

struct CategoryListView: View {
    
    var genre : Genre
    
    var body: some View {
        HStack{
            Text(genre.genreName)
                .font(.system(size: 25))
                .padding(.leading, 10)
        }
    }
}

