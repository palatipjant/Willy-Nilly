//
//  TrailingIconLabelStyle.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
