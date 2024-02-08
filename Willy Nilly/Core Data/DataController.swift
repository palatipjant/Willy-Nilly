//
//  DataController.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    var context: NSPersistentContainer
    @Published var movie: [MovieList] = []
    
    init(){
        context = NSPersistentContainer(name: "Bookworm")
        context.loadPersistentStores { description, error in
            if let error = error {
                print("error loading: \(error)")
            }
        }
    }
    
    func fetchData() {
        let request = NSFetchRequest<MovieList>(entityName: "Student")
        do {
            movie = try context.viewContext.fetch(request)
        } catch (let error) {
            print("error fetching: \(error)")
        }
    }
    
    func addData(movie: Movie) {
        let newEmployee = MovieList(context: context.viewContext)
        newEmployee.id = Int32(movie.id)
        newEmployee.title = movie.title
        newEmployee.overview = movie.overview
        newEmployee.release_date = movie.release_date
        newEmployee.original_language = movie.original_language
        newEmployee.genre_ids = movie.genre_ids
        newEmployee.poster_path = movie.poster_path
        newEmployee.posterURL = movie.posterURL
        self.saveData()
    }
    
    func saveData() {
        do {
            try context.viewContext.save()
        } catch (let error) {
            print("error saving: \(error)")
        }
    }
    
    func deleteData(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = movie[index]
        context.viewContext.delete(entity)
        self.saveData()
    }
}
