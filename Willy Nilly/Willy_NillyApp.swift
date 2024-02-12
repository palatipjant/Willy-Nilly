//
//  Willy_NillyApp.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 21/12/2566 BE.
//

import SwiftUI
import OnboardingKit
import SwiftData

@main
struct Willy_NillyApp: App {

//    @StateObject var viewModel = apiViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            TabHome()
                .environment(\.colorScheme, .dark)
//                .environmentObject(viewModel)
                .modelContainer(for: [LikedMovie.self])
                .showOnboardingIfNeeded(using: .prod)
        }
    }
}
