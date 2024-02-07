//
//  RemoteImage.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("call_me_by_your_name_poster").resizable()
    }
}


struct MovieRemoteImage: View{
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
