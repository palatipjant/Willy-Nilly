//
//  Model.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import Foundation


struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let release_date: String
    let original_language: String
    let genre_ids: [Int]
    
    let poster_path: String?
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
    
}

struct Mockdata {
    static let sampledata = Movie(id: 866398, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")
    
    static let movielist = [
                            Movie(id: 1, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 2, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 3, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 4, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")
    ]
}

struct GenreListResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}


