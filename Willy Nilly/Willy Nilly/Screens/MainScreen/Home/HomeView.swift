//
//  HomeView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @EnvironmentObject var viewModel: apiViewModel
    @State var isinSearch = false
    
    var body: some View {
        ZStack{
            if viewModel.isLoading {
                LoadingView()
            }
            NavigationStack{
                GeometryReader{_ in
                    ScrollView{
                        PopularBanner(movie: viewModel.TrendingMovie.first ?? Mockdata.sampledata)
                            .overlay(content: {
                                LinearPoster()
                            })
                            .background(ScrollViewConfigurator {
                                $0?.bounces = false
                            })
                        HorizonScrollView(titleView: "Trending", movie_api: viewModel.TrendingMovie)
                        HorizonScrollView(titleView: "Upcoming", movie_api: viewModel.UpcomingMovie)
                        HorizonScrollView(titleView: "Top Rated", movie_api: viewModel.TopRatedMovie)
                        HorizonScrollView(titleView: "Now Playing", movie_api: viewModel.NowPlaying)
                        HorizonScrollView(titleView: "Top in Thailand", movie_api: viewModel.TrendThai)
                        CategoryView()
                    }
                    .ignoresSafeArea(edges: .top)
                    .scrollIndicators(.hidden)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            SearchButtonView(isinSearch: $isinSearch)
                                .opacity(0.7)
                                .onTapGesture {
                                    isinSearch = true
                                }
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
        }
        .task {
                viewModel.getUpcomingMovie()
                viewModel.getTrendingMovie()
                viewModel.getTopRated()
                viewModel.getNowPlaying()
                viewModel.getTrendThai()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
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


#Preview {
    HomeView()
        .environment(apiViewModel())
        .preferredColorScheme(.dark)
}
