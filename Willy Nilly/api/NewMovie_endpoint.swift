//
//  NewMovie_endpoint.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 13/1/2567 BE.
//

import Foundation

struct MovieResponse: Codable {
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
}



class NewNetworking {
    static func fetchNewMovies(completion: @escaping (Result<[NewMovie], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!

        var request = URLRequest(url: url)
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzRjZDZhN2RlNGE3NTdhZDM3OGQzZjI0NmQ3M2JjMyIsInN1YiI6IjY1ODMxY2NhODU4Njc4NTUyZWY2ODQwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IbiXRbuekxsTNA0DmI5rfLVipO0VZlxMylkzMPkmCuA", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Data", code: 0, userInfo: nil)))
                return
            }
//            print("Raw Data: \(String(data: data, encoding: .utf8) ?? "N/A")")
            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
