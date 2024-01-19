//
//  Genre_endpoint.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 19/1/2567 BE.
//

import Foundation


struct GenreListResponse: Codable {
    let genres: [genres]
}

struct genres: Codable, Identifiable {
    let id: Int
    let name: String
}

class APIService {
    static let shared = APIService()
    
    private init() {}

    func fetchGenres(apiKey: String, completion: @escaping ([genres]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=\(apiKey)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let result = try JSONDecoder().decode(GenreListResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.genres)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
