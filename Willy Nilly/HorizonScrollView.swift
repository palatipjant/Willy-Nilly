//
//  HorizonScrollView.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import Foundation
import SwiftUI


struct HorizonScrollView: View {
    
    var titleView: String
    var posterName: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(titleView)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading, 20)
                .padding(.bottom, 25)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<10) {_ in
                        Image(posterName)
                            .resizable()
                            .frame(width: 110, height: 162.91)
                            .scaledToFit()
                            .background(Color(.label))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }.padding(.leading,20)
                }
            }.padding(.top, -20)
        }.padding(.top, 25)
    }
}

