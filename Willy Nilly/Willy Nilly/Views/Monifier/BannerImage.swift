//
//  BannerImage.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI

struct BannerImage: ViewModifier{
    func body(content: Content) -> some View{
        content
            .frame(maxWidth: .infinity)
            .scaledToFill()
            .background(Color(.label))
    }
}

extension View {
    func bannerImage() -> some View {
        modifier(BannerImage())
    }
}
