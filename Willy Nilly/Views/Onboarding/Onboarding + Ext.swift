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
                                                 title: "Explore Movies Worldwide",
                                                 content: "Discover a vast array of films from all corners of the globe. Dive into diverse cultures and cinematic experiences."),
                                           .init(image: Image(systemName: "film.stack.fill"),
                                                 title: "Discover Random Movies",
                                                 content: "LLet MovieMingle surprise you with hidden gems and unexpected delights. Every movie night is an adventure waiting to unfold."),
                                           .init(image: Image(systemName: "list.bullet.rectangle.fill"),
                                                 title: "Create Your Personalized Lists",
                                                 content: "Create custom lists to track your favorites and mark what you've seen. Organize your movie journey exactly how you like it."),
                                           .init(image: Image(systemName: "person.text.rectangle.fill"),
                                                 title: "Follow Your Favorite Actors and Actresses",
                                                 content: "Follow actors and actresses from around the world for the latest news and projects. Connect with fellow movie enthusiasts and share your passion.")])
}
