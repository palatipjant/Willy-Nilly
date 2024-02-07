//
//  ViewModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 6/2/2567 BE.
//

import SwiftUI

@MainActor final class ViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    @Published var NewMovie: [NewMovie] = []
    
    @Published var Genre: [Genre] = []
    
    @Published var PopMovie: [PopMovie] = []
    
    @Published var SearchMovie: [SearchMovie] = []
    
    func getNewMovie() {
        isLoading = true
        Task{
            do{
                NewMovie = try await NetworkManager.shared.fetchNewMovie()
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
    
    func getPopMovie() {
        isLoading = true
        Task{
            do{
                PopMovie = try await NetworkManager.shared.fetchPopMovie()
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
//                SearchMovie = try await NetworkManager.shared.fetchSearch(query: query, page: page)
                isLoading = false
            } catch {
                alertItem = AlertContext.GeneralError
                isLoading = false
            }
        }
    }
}
