//
//  NetworkManager.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import Foundation
import UIKit


final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.themoviedb.org/3"
    //  End point
    private let upcomingED = baseURL + "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&primary_release_date.gte=2024-02-17&primary_release_date.lte=2024-12-31&sort_by=popularity.desc&with_release_type=2&year=2024"
    private let genresED = baseURL + "/genre/movie/list?language=en"
    private let trendingED = baseURL + "/trending/movie/day?language=en-US"
    private let topRatedED = baseURL + "/movie/top_rated?language=en-US&page=1"
    private let nowPlayingED = baseURL + "/movie/now_playing?language=en-US&page=1"
    private let trendThai = baseURL + "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&primary_release_year=2024&sort_by=popularity.desc&with_original_language=th"
    private let popularPerson = baseURL + "/person/popular?language=en-US&page=1"
    
    let authToken = ""

    
    private init() {}
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
    
    func fetchUpcomingMovie() async throws -> [Movie] {
        
        guard let url = URL(string: upcomingED) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchMovieDetail(movieID: String) async throws -> MovieDetail {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?append_to_response=results&language=en-US") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieDetail.self, from: data)
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchGenres() async throws -> [Genre] {
        guard let url = URL(string: genresED) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(GenreListResponse.self, from: data).genres
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchTrending() async throws -> [Movie] {
        guard let url = URL(string: trendingED) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch let error as APError {
            switch error {
            case .invalidURL:
                print("Invalid URL: \(error.localizedDescription)")
            case .invalidResponse:
                print("Invalid response from the server")
            case .invalidData:
                print("Invalid data received from the server")
                // Handle other cases as needed
            case .unableToComplete:
                print("unableToComplete")
            case .authenticationError:
                print("authenticationError")
            }
            throw error
        } catch {
            // Handle other types of errors
            print("An unexpected error occurred: \(error)")
            throw APError.invalidData
        }
    }
    
    func fetchSearch(query: String, page: Int) async throws -> [Movie] {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=\(page)") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchTopRated() async throws -> [Movie] {
        guard let url = URL(string: topRatedED) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchNowPlaying() async throws -> [Movie] {
        guard let url = URL(string: nowPlayingED) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        }
    }
    
    func fetchTrendThai() async throws -> [Movie] {
        guard let url = URL(string: trendThai) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        }
    }
    
    func fetchMovieByGenre(genreID: String, page: Int) async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=\(page)&sort_by=popularity.desc&with_genres=\(genreID)") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchMovieSimilar(movieID: String) async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/similar?language=en-US&page=1") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchCredits(movieID: String) async throws -> [Cast] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?language=en-US") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(CreditsResponse.self, from: data).cast
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchCastDetail(castID: String) async throws -> CastDetail {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/person/\(castID)?language=en-US") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            //            let json = try JSONSerialization.jsonObject(with: data, options: [])
            //            print(json)
            let decoder = JSONDecoder()
            return try decoder.decode(CastDetail.self, from: data)
        } catch {
            print("Error converting JSON data to object: \(error)")
            throw APError.invalidData
        }
    }
    
    func fetchCastImages(castID: Int) async throws -> [CastImage] {
        guard let url = URL(string: "https://api.themoviedb.org/3/person/\(castID)/images") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(CastImagesResponse.self, from: data).profiles
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchMovieReview(movieID: String) async throws -> [MovieReview] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/reviews?language=en-US&page=1") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieReviewResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchMovieDiscover(page: Int) async throws -> [Movie] {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=\(page)&primary_release_date.gte=2010-01-01&primary_release_date.lte=2024-01-31&sort_by=popularity.desc") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).results
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchPopularPerson() async throws -> [Person] {
        guard let url = URL(string: popularPerson) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            //            let json = try JSONSerialization.jsonObject(with: data, options: [])
            //            print(json)
            let decoder = JSONDecoder()
            return try decoder.decode(PersonResponse.self, from: data).results
        } catch {
            //            print("Error converting JSON data to object: \(error)")
            throw APError.invalidData
        }
    }
    
    func fetchPersonMovieCredits(person_id: Int) async throws -> [Movie] {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/person/\(person_id)/movie_credits?language=en-US") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(PersonMovieCreditsResponse.self, from: data).cast
        } catch {
            throw APError.invalidData
        }
    }
    
    func fetchMovieImage(id: Int) async throws -> [backdrop] {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/images") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            return try decoder.decode(MovieImg.self, from: data).backdrops
        } catch {
            throw APError.invalidData
        }
    }
    
}
