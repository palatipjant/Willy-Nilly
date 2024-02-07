//
//  Model.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import Foundation


struct NewMovieResponse: Codable {
    let results: [NewMovie]
}

struct NewMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String?
    
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
    
    let overview: String
}

struct GenreListResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

struct PopMovieResponse: Codable {
    let results: [PopMovie]
}

struct PopMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String
    
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

struct SearchResponse: Codable {
    let results: [SearchMovie]
}

struct SearchMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String?
    
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

