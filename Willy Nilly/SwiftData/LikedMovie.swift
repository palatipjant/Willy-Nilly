//
//  LikedMovie.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/2/2567 BE.
//

import Foundation
import SwiftData

@Model
final class LikedMovie: Identifiable {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String?
    var release_date: String
    var original_language: String
    var genre_ids: [Int]
    
    var poster_path: String?
    var posterURL: URL?
    
    init(id: Int, title: String, overview: String? = nil, release_date: String, original_language: String, genre_ids: [Int], poster_path: String? = nil, posterURL: URL? = nil) {
        self.id = id
        self.title = title
        self.overview = overview
        self.release_date = release_date
        self.original_language = original_language
        self.genre_ids = genre_ids
        self.poster_path = poster_path
        self.posterURL = posterURL
    }
}
