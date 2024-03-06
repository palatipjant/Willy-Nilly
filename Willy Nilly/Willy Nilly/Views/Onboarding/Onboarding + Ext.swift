//
//  Onboarding + Ext.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import OnboardingKit
import SwiftUI

extension OnboardingConfiguration {
    static let prod = Self.init(privacyUrlString: "https://www.apple.com/legal/privacy/data/en/app-store/",
                                accentColor: .accent,
                                features: [.init(image: Image(systemName: "film.fill"),
                                                 title: "Movies Worldwide",
                                                 content: "Discover a vast array of films from all corners of the globe. Dive into diverse cultures."),
                                           .init(image: Image(systemName: "film.stack.fill"),
                                                 title: "Random Movies",
                                                 content: "Let MovieMingle surprise you with hidden gems and unexpected delights."),
                                           .init(image: Image(systemName: "list.bullet.rectangle.fill"),
                                                 title: "Personalized Lists",
                                                 content: "Create liked lists to track your favorites."),
                                           .init(image: Image(systemName: "person.text.rectangle.fill"),
                                                 title: "Your Favorite Cast",
                                                 content: "Follow actors and actresses from around the world for the latest news and projects.")])
}
