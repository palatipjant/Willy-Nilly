//
//  SearchButton.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI

struct SearchButtonView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: SearchView()) {
                HStack{
                    Capsule()
                        .fill(.blendMode(.multiply))
                        .strokeBorder(.white, lineWidth: 2)
                        .frame(width: 90, height: 35)
                        .foregroundStyle(.gray)
                        .overlay {
                            Text("Search")
                                .foregroundStyle(.white)
                        }
                }
            }
        }
    }
}

