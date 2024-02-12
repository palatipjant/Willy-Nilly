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

struct Movie: Codable, Identifiable, Hashable {
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
    static let sampledata = Movie(id: 0, title: "", overview: "", release_date: "", original_language: "", genre_ids: [0], poster_path: "")
    
    static let movielist = [
                            Movie(id: 0, title: "", overview: "", release_date: "", original_language: "", genre_ids: [0], poster_path: ""),
                            Movie(id: 1, title: "", overview: "", release_date: "", original_language: "", genre_ids: [0], poster_path: ""),
                            Movie(id: 2, title: "", overview: "", release_date: "", original_language: "", genre_ids: [0], poster_path: ""),
                            Movie(id: 3, title: "", overview: "", release_date: "", original_language: "", genre_ids: [0], poster_path: "")
    ]
    
    static let movieDetailsample = MovieDetail(id: 0,
                                               title: "",
                                               overview: "",
                                               release_date: "",
                                               original_language: "",
                                               budget: 0,
                                               revenue: 0,
                                               runtime: 0,
                                               status: "",
                                               vote_average: 0,
                                               poster_path: "")
    
    static let castDetailSample = CastDetail(id: 0,
                                             name: "",
                                             biography: "",
                                             known_for_department: "",
                                             place_of_birth: "",
                                             popularity: 0,
                                             birthday: "",
                                             also_known_as: [
                                                ""
                                              ],
                                             profile_path: "")
}

struct GenreListResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}


struct MovieDetailResponse: Codable {
    let results: MovieDetail
}

struct MovieDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let release_date: String
    let original_language: String
    let budget: Int
    let revenue: Int
    let runtime: Int
    let status: String
    let vote_average: Double
    
    let poster_path: String?
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}


struct CreditsResponse: Codable{
    let cast: [Cast]
}

struct Cast: Codable, Identifiable{
    let id: Int
    let name: String
    let original_name: String
    let character: String
    
    let profile_path: String?
    var profileURL: URL? {
        if let poster = profile_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

struct PersonResponse: Codable{
    let results: [Person]
}

struct Person: Codable, Identifiable{
    let id: Int
    let name: String
    let original_name: String
    let known_for_department: String?
    let popularity: Double
    
    
    let profile_path: String?
    var profileURL: URL? {
        if let poster = profile_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

struct CastDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let biography: String?
    let known_for_department: String
    let place_of_birth: String?
    let popularity: Double
    let birthday: String?
    let also_known_as: [String]
    
    let profile_path: String?
    var profileURL: URL? {
        if let profile = profile_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + profile)
        }
        return nil
    }
}

struct CastImagesResponse: Codable {
    let profiles: [CastImage]
}

struct CastImage: Codable{
    let vote_average: Double
    
    let file_path: String?
    var imageURL: URL? {
        if let filepath = file_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + filepath)
        }
        return nil
    }
}


struct MovieReviewResponse: Codable {
    let results: [MovieReview]
}

struct MovieReview: Codable{
    let author: String
    let author_details: avatar_details
    let content: String
}

struct avatar_details: Codable, Hashable{
    let name: String
    let username: String
    let avatar_path: String?
}


struct PersonMovieCreditsResponse: Codable {
    let cast: [Movie]
}
