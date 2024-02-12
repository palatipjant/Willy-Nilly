//
//  MarkAsSeenButton.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 10/2/2567 BE.
//

import SwiftUI
import ConfettiSwiftUI

struct MarkAsSeenButton: View{
    
    @State private var confetti = 0
    @State private var likeClick = false
    
    var body: some View {
        Button(action: {
            likeClick.toggle()
            confetti += 1
        }, label: {
            Circle()
                .fill(.white)
                .shadow(radius: 5)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: likeClick ? "eye.fill" : "eye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(likeClick ? .black : .black)
                }
                .tint(likeClick ? .red : .gray)
        })
        .buttonStyle(MarkAsSeenEffectButtonStyle(confetti: $confetti))
    }
}

struct MarkAsSeenEffectButtonStyle: ButtonStyle {
    
    @Binding var confetti: Int
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
            .confettiCannon(counter: $confetti,
                            confettis: [.text("👀"), .text("🍿"), .text("📺"), .text("🎉")],
                            confettiSize: 20,
                            radius: 220)
    }
}


#Preview {
    LikeButton()
}
