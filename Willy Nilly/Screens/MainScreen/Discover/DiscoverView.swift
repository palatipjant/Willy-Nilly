//
//  DiscoverView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI
import ConfettiSwiftUI

struct DiscoverView: View {
    
    @State private var confetti = 0
    
    var body: some View {
        Button {
            confetti += 1
        } label: {
            Label("Like", systemImage: "heart.fill")
        }
        .confettiCannon(counter: $confetti, confettis: [.text("🎬"), .text("🍿"), .text("🍷"), .text("❤️")], confettiSize: 20)

    }
}

#Preview {
    DiscoverView()
}
