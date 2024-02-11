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
    
    static let movieDetailsample = MovieDetail(id: 866398,
                                               title: "The test",
                                               overview: "test man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
                                               release_date: "test-01-10",
                                               original_language: "test",
                                               budget: 35000000,
                                               revenue: 122926919,
                                               runtime: 105,
                                               status: "Released",
                                               vote_average: 3775.726,
                                               poster_path: "/A7EByudX0eOzlkQ2FIbogzyazm2.jpg")
    
    static let castDetailSample = CastDetail(id: 0,
                                             name: "NF",
                                             biography: "NF",
                                             known_for_department: "NF",
                                             place_of_birth: "NF",
                                             popularity: 0,
                                             birthday: "9999-07-26",
                                             also_known_as: [
                                                "NF"
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
