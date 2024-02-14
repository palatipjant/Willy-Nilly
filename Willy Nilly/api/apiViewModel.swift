//
//  ViewModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import SwiftUI

@MainActor final class apiViewModel: ObservableObject {
    
    @Published var likedMovies: [SaveLists] = []
    @Published var SeenMovies: [SaveLists] = []
    
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    @Published var UpcomingMovie: [Movie] = []
    @Published var Genre: [Genre] = []
    @Published var TrendingMovie: [Movie] = []
    @Published var TopRatedMovie: [Movie] = []
    @Published var NowPlaying: [Movie] = []
    @Published var SearchMovie: [Movie] = []
    @Published var TrendThai: [Movie] = []
    @Published var MovieByGenre: [Movie] = []
    @Published var MovieDetail: MovieDetail = Mockdata.movieDetailsample
    @Published var MovieSimilar: [Movie] = []
    @Published var MovieCredits: [Cast] = []
    @Published var CastDetail: CastDetail = Mockdata.castDetailSample
    @Published var CastImage: [CastImage] = []
    @Published var MovieReview: [MovieReview] = []
    @Published var MovieDiscover: [Movie] = []
    @Published var PopularPerson: [Person] = []
    @Published var PersonMovieCredits: [Movie] = []
    @Published var isMovieDiscoverLoaded = false
    
    func getLikedMovies() -> [SaveLists] {
            return likedMovies.filter { $0.tag == "Liked" }
        }
    
    func getSeenMovies() -> [SaveLists] {
            return SeenMovies.filter { $0.tag == "Seen" }
        }
    
    func removeMovieFromDiscover(withId id: Int) {
            if let index = MovieDiscover.firstIndex(where: { $0.id == id }) {
                MovieDiscover.remove(at: index)
            }
        }
    
    func getUpcomingMovie() {
        isLoading = true
        Task{
            do{
                UpcomingMovie = try await NetworkManager.shared.fetchUpcomingMovie()
                isLoading = false
            } catch{
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieDetail(movieID: String) {
        isLoading = true
        Task{
            do{
                MovieDetail = try await NetworkManager.shared.fetchMovieDetail(movieID: movieID)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    func getGenre() {
        isLoading = true
        Task{
            do{
                Genre = try await NetworkManager.shared.fetchGenres()
                isLoading = false
            } catch{
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getTrendingMovie() {
        isLoading = true
        Task{
            do{
                TrendingMovie = try await NetworkManager.shared.fetchTrending()
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getSearch(query: String, page:Int) {
        isLoading = true
        Task{
            do{
                SearchMovie.append(contentsOf: try await NetworkManager.shared.fetchSearch(query: query, page: page))
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getTopRated() {
        isLoading = true
        Task{
            do{
                TopRatedMovie = try await NetworkManager.shared.fetchTopRated()
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getNowPlaying() {
        isLoading = true
        Task{
            do{
                NowPlaying = try await NetworkManager.shared.fetchNowPlaying()
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getTrendThai() {
        isLoading = true
        Task{
            do{
                TrendThai = try await NetworkManager.shared.fetchTrendThai()
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieByGenre(genreID: String, page: Int) {
        isLoading = true
        Task{
            do{
                MovieByGenre = try await NetworkManager.shared.fetchMovieByGenre(genreID: genreID, page: page)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieSimilar(movieID: String) {
        isLoading = true
        Task{
            do{
                MovieSimilar = try await NetworkManager.shared.fetchMovieSimilar(movieID: movieID)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieCredits(movieID: String) {
        isLoading = true
        Task{
            do{
                MovieCredits = try await NetworkManager.shared.fetchCredits(movieID: movieID)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getCastDetail(cast: String) {
        isLoading = true
        Task{
            do{
                CastDetail = try await NetworkManager.shared.fetchCastDetail(castID: cast)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getCastImages(cast: Int) {
        isLoading = true
        Task{
            do{
                CastImage = try await NetworkManager.shared.fetchCastImages(castID: cast)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieReview(movieID: String) {
        isLoading = true
        Task{
            do{
                MovieReview = try await NetworkManager.shared.fetchMovieReview(movieID: movieID)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getMovieDiscover(page: Int) {
        isLoading = true
        Task{
            do{
                MovieDiscover.append(contentsOf: try await NetworkManager.shared.fetchMovieDiscover(page: page))
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getPopularPerson() {
        isLoading = true
        Task{
            do{
                PopularPerson = try await NetworkManager.shared.fetchPopularPerson()
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
    
    func getPersonMovieCredits(person_id: Int) {
        isLoading = true
        Task{
            do{
                PersonMovieCredits = try await NetworkManager.shared.fetchPersonMovieCredits(person_id: person_id)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
}
