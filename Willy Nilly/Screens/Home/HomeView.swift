//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject var viewModel = apiViewModel()
    
    var body: some View {
        NavigationStack{
            GeometryReader{_ in
                ScrollView{
                    PopularBanner()
                        .background(ScrollViewConfigurator {
                            $0?.bounces = false
                        })
                    LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .offset(y: -155)
                    HorizonScrollView(titleView: "Trending", movie_api: viewModel.TrendingMovie)
                        .offset(y: -160)
                    HorizonScrollView(titleView: "Upcoming", movie_api: viewModel.UpcomingMovie)
                        .offset(y: -160)
                    HorizonScrollView(titleView: "Top Rated", movie_api: viewModel.TopRatedMovie)
                        .offset(y: -160)
                    HorizonScrollView(titleView: "Now Playing", movie_api: viewModel.NowPlaying)
                        .offset(y: -160)
                    CategoryView()
                        .offset(y: -130)
                }
                .ignoresSafeArea()
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        SearchButtonView()
                            .opacity(0.7)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Home")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
            }
        }
        .task {
            viewModel.getUpcomingMovie()
            viewModel.getTrendingMovie()
            viewModel.getTopRated()
            viewModel.getNowPlaying()
        }
    }
}

#Preview {
    HomeView(viewModel: apiViewModel())
}


struct ScrollViewConfigurator: UIViewRepresentable {
    let configure: (UIScrollView?) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            configure(view.enclosingScrollView())
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension UIView {
    func enclosingScrollView() -> UIScrollView? {
        var next: UIView? = self
        repeat {
            next = next?.superview
            if let scrollview = next as? UIScrollView {
                return scrollview
            }
        } while next != nil
        return nil
    }
}
