//
//  PosterModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Foundation

struct Movie_Detail: Identifiable, Codable{
    var id = UUID()
    var titleName: String
    var posterName: String
    var movie_lenght: String
    var isMovie: Bool
    var category: [String]
}

struct Genre: Identifiable, Codable, Hashable{
    var id = UUID()
    var genreName: String
}

struct Season: Identifiable, Codable{
    var id = UUID()
    var seasonName: String
    var seasonImage: String
}

struct Movies {
    var movie_mostpick: [Movie_Detail] = [
        Movie_Detail(titleName: "Call Me By Your Name",
                     posterName: "call_me_by_your_name_poster",
                     movie_lenght: "1.3h", isMovie: true,
                     category: ["Romantic", "Drama"]),
         Movie_Detail(titleName: "Call Me By Your Name",
                      posterName: "the_christmas_chronicles_poster",
                      movie_lenght: "1.3h", isMovie: true,
                      category: ["Romantic", "Drama"])
    ]
}

struct Genres {
    var sample_genres: Genre = Genre(genreName: "Drama")
    
    
    var all_genres: [Genre] = [
        Genre(genreName: "History"),
        Genre(genreName: "Drama"),
        Genre(genreName: "Action"),
        Genre(genreName: "Adventure"),
        Genre(genreName: "Animation"),
        Genre(genreName: "Comedy"),
        Genre(genreName: "Crime"),
        Genre(genreName: "Fantasy"),
        Genre(genreName: "Horror"),
        Genre(genreName: "Mystery"),
        Genre(genreName: "Romance"),
        Genre(genreName: "Sci-Fi"),
        Genre(genreName: "Thirller"),
        Genre(genreName: "War")
    ]
}

struct Seasons {
    var seasons: [Season] = [
        Season(seasonName: "Spring", seasonImage: "summer"),
        Season(seasonName: "Autumn", seasonImage: ""),
        Season(seasonName: "Summer", seasonImage: ""),
        Season(seasonName: "Winter", seasonImage: ""),
        Season(seasonName: "Christmas", seasonImage: ""),
        Season(seasonName: "New Year", seasonImage: ""),
        Season(seasonName: "Chinese New Year", seasonImage: "")
    ]
}
