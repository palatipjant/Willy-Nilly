//
//  SearchApi.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 24/1/2567 BE.
//

import SwiftUI

struct Movie: Identifiable {
    let id: Int
    let title: String
}

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func searchMovies(query: String) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=1") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzRjZDZhN2RlNGE3NTdhZDM3OGQzZjI0NmQ3M2JjMyIsInN1YiI6IjY1ODMxY2NhODU4Njc4NTUyZWY2ODQwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IbiXRbuekxsTNA0DmI5rfLVipO0VZlxMylkzMPkmCuA", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(SearchResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = result.results
                    print(self.movies)
                }
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct SearchResponse: Codable {
    let results: [Movie]
}

struct SearchView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Search movies", text: $searchText)
                .onSubmit {
                    viewModel.searchMovies(query: searchText)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
            
            List(viewModel.movies, id: \.id) { movie in
                Text(movie.title)
            }
        }
    }
}

extension Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        // Add more properties as needed
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        // Add more properties as needed
    }
}
