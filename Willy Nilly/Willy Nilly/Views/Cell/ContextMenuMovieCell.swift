//
//  ContextMenuMovieCell.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI

struct ContextMenuMovieCell: View {
    
    var movie: Movie
    
    var body: some View {
        NavigationLink(destination: OverviewMovie(movie: movie)) {
            Label("Overview", systemImage: "doc.plaintext.fill")
        }

    }
}
