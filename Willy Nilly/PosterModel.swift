//
//  PosterModel.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 12/1/2567 BE.
//

import SwiftUI
import Foundation

struct Movie_Detail: Identifiable, Codable{
    var id = UUID()
    var titleName: String
    var posterName: String
    var movie_lenght: String
    var isMovie: Bool
    var category: [String]
}


struct Movies {
    var movie: [Movie_Detail] = [
        Movie_Detail(titleName: "Call Me By Your Name",
                     posterName: "call_me_by_your_name_poster",
                     movie_lenght: "1.3h", isMovie: true,
                     category: ["Romantic", "Drama"]),
         Movie_Detail(titleName: "Call Me By Your Name",
                      posterName: "the_christmas_chronicles_poster",
                      movie_lenght: "1.3h", isMovie: true,
                      category: ["Romantic", "Drama"])
    ]
}
