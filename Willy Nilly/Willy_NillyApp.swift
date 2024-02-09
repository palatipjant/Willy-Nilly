//
//  Willy_NillyApp.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 21/12/2566 BE.
//

import SwiftUI
import OnboardingKit

@main
struct Willy_NillyApp: App {
    var body: some Scene {
        WindowGroup {
            TabHome()
                .environment(\.colorScheme, .dark)
                .showOnboardingIfNeeded(using: .prod)
        }
    }
}
