//
//  ViewModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import SwiftUI

@MainActor final class apiViewModel: ObservableObject {
    
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
    
    func getTrendThat() {
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
    
    func getMovieByGenre(genreID: String) {
        isLoading = true
        Task{
            do{
                MovieByGenre = try await NetworkManager.shared.fetchMovieByGenre(genreID: genreID)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
}
