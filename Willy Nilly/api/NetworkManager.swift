//
//  NetworkManager.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import Foundation
import UIKit

struct NewMovieResponse1: Codable {
    let results: [NewMovie1]
}

struct NewMovie1: Codable, Identifiable {
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

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.themoviedb.org/3/discover/movie"
    private let appetizerURL = baseURL
    
    private init() {}
    
    func getAppetizers() async throws -> [NewMovie1] {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        // Add authentication token or credentials to the request headers
        let authToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzRjZDZhN2RlNGE3NTdhZDM3OGQzZjI0NmQ3M2JjMyIsInN1YiI6IjY1ODMxY2NhODU4Njc4NTUyZWY2ODQwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IbiXRbuekxsTNA0DmI5rfLVipO0VZlxMylkzMPkmCuA"
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(NewMovieResponse1.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }

}
