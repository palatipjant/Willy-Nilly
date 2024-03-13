//
//  LoadingView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.accent
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct LoadingView: View{
    var body: some View{
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}

#Preview {
    LoadingView()
}
