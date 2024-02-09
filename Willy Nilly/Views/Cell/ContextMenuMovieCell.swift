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
        NavigationLink(destination: OverviewMovie(Movie: movie)) {
            Label("Overview", systemImage: "doc.plaintext.fill")
        }
        NavigationLink(destination: OverviewMovie(Movie: movie)) {
            Label("Like", systemImage: "heart.fill")
        }
        NavigationLink(destination: OverviewMovie(Movie: movie)) {
            Label("Mark as seen", systemImage: "eye.fill")
        }
    }
}
