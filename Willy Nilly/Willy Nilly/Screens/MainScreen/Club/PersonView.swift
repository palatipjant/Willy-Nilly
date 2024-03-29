//
//  ClubView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 9/2/2567 BE.
//

import SwiftUI

struct PersonView: View {
    
    @EnvironmentObject var viewModel: apiViewModel
    
    var body: some View {
        NavigationStack{
            if viewModel.isLoading {
                LoadingView()
            }
            ZStack{
                List {
                    ForEach(viewModel.PopularPerson) { cast in
                        NavigationLink(destination: EachCastView(cast: cast.id, profile_path: cast.profile_path ?? "")) {
                            HStack{
                                MovieRemoteImage(urlString: "https://image.tmdb.org/t/p/w500\(cast.profile_path ?? "")" )
                                    .frame(width: 100, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                VStack(alignment: .leading){
                                    Text(cast.name)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text("Department: \(cast.known_for_department ?? "")")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    Text("Rating: \(cast.popularity, specifier: "%.2f")")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    
                                }.padding(.leading)
                            }
                        }
                    }
                }.listStyle(.plain)
                    .padding(.top)
            }
            .onAppear {
                viewModel.getPopularPerson()
            }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
            .navigationTitle("Popular Person")
        }
    }
}

#Preview {
    PersonView()
        .environment(apiViewModel())
        .preferredColorScheme(.dark)
}
