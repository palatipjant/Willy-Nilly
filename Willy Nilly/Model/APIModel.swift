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
    
//    static let movieProvidersSample = MovieWatchProvidersUS(
//                                            US: MovieWatchProvidersRent(
//                                            rent: [MovieWatchProviders(
//                                                id: UUID(),
//                                                provider_id: 2,
//                                                provider_name: "Apple TV", logo_path: "/9ghgSC0MA082EL6HLCW3GalykFD.jpg")]))
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

