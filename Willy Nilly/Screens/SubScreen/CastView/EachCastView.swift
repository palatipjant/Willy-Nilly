//
//  EachCastView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 10/2/2567 BE.
//

import SwiftUI

struct EachCastView: View{
    
    @State var isRead = false
    var cast: Cast
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom){
            GeometryReader{_ in
                ScrollView{
                    VStack{
                        MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(cast.profile_path ?? "")" )
                            .bannerImage()
                            .overlay(content: { LinearPoster() })
                            .background(ScrollViewConfigurator { $0?.bounces = false })

                        VStack(alignment: .leading, spacing: 20){
                            Text(viewModel.CastDetail.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                            
                            CastBiograp(castDetail: viewModel.CastDetail)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(viewModel.CastDetail.biography)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(isRead ? 100 : 3)
                                Button(isRead ? "Read Less" : "Read More" ) {
                                    isRead.toggle()
                                }
                            }
                            .font(.system(size: 16, weight: .regular))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                            .multilineTextAlignment(.leading)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .offset(y: -150)
                        
                        if !viewModel.CastImage.isEmpty {
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Images")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.leading, 20)
                                    Spacer()
                                }
                                ScrollView(.horizontal) {
                                    HStack{
                                        ForEach(viewModel.CastImage, id: \.file_path) {image in
                                            MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(image.file_path ?? "")" )
                                                .frame(width: 110, height: 162.91)
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .scrollTransition { content, phase in
                                                    content
                                                        .scaleEffect(phase.isIdentity ? 1 : 0.45)
                                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                                }
                                        }
                                        .padding(.leading,15)
                                    }
                                    .frame(height: 180)
                                }
                                .padding(.top, -10)
                            }
                            .offset(y: -150)
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
                .toolbarBackground(.hidden, for: .navigationBar)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .task {
            viewModel.getCastDetail(cast: cast.id)
            viewModel.getCastImages(cast: cast.id)
        }
        .ignoresSafeArea(edges: .top)
    }
}


struct CastBiograp: View {
    
    var castDetail: CastDetail
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Capsule()
                    .fill(.blendMode(.multiply))
                    .strokeBorder(.white, lineWidth: 1)
                    .frame(width: 80, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.6)
                    .overlay {
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundStyle(.yellow)
                                .frame(width: 12, height: 12)
                            Text("\(castDetail.popularity, specifier: "%.2f")")
                                .fontWeight(.medium)
                                .font(.system(size: 12))
                        }
                    }
                Capsule()
                    .fill(.blendMode(.multiply))
                    .strokeBorder(.white, lineWidth: 1)
                    .frame(width: 95, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.6)
                    .overlay {
                        Text("\(castDetail.birthday)")
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                    }
                Capsule()
                    .fill(.blendMode(.multiply))
                    .strokeBorder(.white, lineWidth: 1)
                    .frame(width: 65, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.6)
                    .overlay {
                        Text("\(castDetail.known_for_department)")
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                    }
            }
            HStack{
                Capsule()
                    .fill(.blendMode(.multiply))
                    .strokeBorder(.white, lineWidth: 1)
                    .frame(width: 230, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.6)
                    .overlay {
                        Text("\(castDetail.place_of_birth)")
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                    }
            }
        }.padding(.leading)
    }
}

#Preview(body: {
    EachCastView(cast: Cast(id: 976,
                            name: "Jason Statham",
                            original_name: "Jason Statham",
                            character:  "Adam Clay",
                            profile_path: "/lldeQ91GwIVff43JBrpdbAAeYWj.jpg"))
})
