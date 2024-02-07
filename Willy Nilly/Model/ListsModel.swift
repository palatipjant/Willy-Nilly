//
//  ListsModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI

struct MyLists: Codable {
    
    var listName: String = ""
    var emoji: String = ""
    var movie: [Movie] = []
    
}

struct AllLists: Codable {
    var lists: [MyLists] = []
}

final class ListsModel: ObservableObject{
    
    @AppStorage("lists") private var ListsData: Data?
    @Published var mylists = MyLists()
    @Published var allList = AllLists()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        
        guard !mylists.listName.isEmpty &&  !mylists.emoji.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(ListsData)
            ListsData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let ListsData else { return }
        
        do {
            allList = try JSONDecoder().decode(AllLists.self, from: ListsData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
    }
}
