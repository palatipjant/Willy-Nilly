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
    // Add more properties as needed
}

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func searchMovies(query: String, page: Int = 1) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=\(page)") else {
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
                    self.movies.append(contentsOf: result.results)

                    // Check if there are more pages
                    if result.page < result.total_pages {
                        // Fetch the next page
                        self.searchMovies(query: query, page: result.page + 1)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                print("Failed JSON String: \(String(data: data, encoding: .utf8) ?? "N/A")")
            }
        }.resume()
    }
}

struct SearchResponse: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int

    // Add other necessary properties
}

struct SearchView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Search movies", text: $searchText, onCommit: {
                viewModel.searchMovies(query: searchText)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            List(viewModel.movies, id: \.id) { movie in
                Text(movie.title)
                // Add more movie details as needed
            }
        }
        .onAppear {
            // Optional: Load initial data when the view appears
//             viewModel.searchMovies(query: "sand")
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(viewModel: <#T##arg#>, searchText: <#T##arg#>)
//    }
//}

// SwiftUI previews require a concrete type conforming to Identifiable.
// This is a dummy implementation for preview purposes.
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
