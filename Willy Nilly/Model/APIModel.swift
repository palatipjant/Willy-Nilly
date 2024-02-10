//
//  Model.swift
//  Willy Nilly
//
//  Created by Palatip Jantawong on 8/2/2567 BE.
//

import Foundation


struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let release_date: String
    let original_language: String
    let genre_ids: [Int]
    
    let poster_path: String?
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

struct Mockdata {
    static let sampledata = Movie(id: 866398, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")
    
    static let movielist = [
                            Movie(id: 1, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 2, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 3, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg"),
                            Movie(id: 4, title: "The Beekeeper", overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.", release_date: "2024-01-10", original_language: "en", genre_ids: [28], poster_path: "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")
    ]
    
    static let movieDetailsample = MovieDetail(id: 866398,
                                               title: "The test",
                                               overview: "test man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
                                               release_date: "test-01-10",
                                               original_language: "test",
                                               budget: 35000000,
                                               revenue: 122926919,
                                               runtime: 105,
                                               status: "Released",
                                               vote_average: 3775.726,
                                               poster_path: "/A7EByudX0eOzlkQ2FIbogzyazm2.jpg")
    
    static let castDetailSample = CastDetail(id: 976,
                                             name: "Jason Statham",
                                             biography: "Jason Statham (born July 26, 1967) is an English actor. He is known for portraying characters in various action-thriller films who are typically tough, hardboiled, gritty, or violent.\n\nStatham began practising Chinese martial arts, kickboxing, and karate recreationally in his youth while working at local market stalls. An avid footballer and diver, he was a member of Britain's national diving team and competed for England in the 1990 Commonwealth Games. Shortly after, he was asked to model for French Connection, Tommy Hilfiger, and Levi's in various advertising campaigns. His past history working at market stalls inspired his casting in the Guy Ritchie crime films Lock, Stock and Two Smoking Barrels (1998) and Snatch (2000).\n\nThe commercial success of these films led Statham to star as Frank Martin in the Transporter trilogy (2002–2008). After starring in a variety of heist and action-thriller films such as The Italian Job (2003), Crank (2006), War (2007), The Bank Job (2008), The Mechanic (2011), Spy (2015), and Mechanic: Resurrection (2016), he established himself as a Hollywood leading man. However, he has also starred in commercially and critically unsuccessful films such as Revolver (2005), Chaos (2005), In the Name of the King (2007), 13 (2010), Blitz (2011), Killer Elite (2011), Hummingbird (2013), and Wild Card (2015). He regained commercial success as a part of the ensemble action series The Expendables (2010–2014) and the Fast & Furious franchise. In the latter, he has played Deckard Shaw in Fast & Furious 6 (2013), Furious 7 (2015), The Fate of the Furious (2017), F9 (2021) and the spin-off Fast & Furious Presents: Hobbs & Shaw (2019). He was credited as a co-producer on Hobbs & Shaw, receiving his first production credit.\n\nStatham's acting has been criticised for lacking depth and variety, but he has also been praised for leading the resurgence of action films during the 2000s and 2010s. According to a BBC News report, his film career from 2002 to 2017 generated an estimated $1.5 billion (£1.1 billion) in ticket sales, making him one of the film industry's most bankable stars.",
                                             known_for_department: "Acting",
                                             place_of_birth: "Shirebrook, Derbyshire, England, UK",
                                             popularity: 170.087,
                                             birthday: "1967-07-26",
                                             also_known_as: [
                                                "Джейсон Стейтем",
                                                "Джейсон Стэйтем",
                                                "جيسون ستاثام",
                                                "ジェイソン・ステイサム",
                                                "เจสัน สเตธัม",
                                                "傑森·史塔森",
                                                "Джейсън Стейтъм",
                                                "ჯეისონ სტეტჰემი",
                                                "Τζέισον Στέιθαμ",
                                                "JS",
                                                "杰森·斯坦森",
                                                "제이슨 스타뎀",
                                                "جیسون استاتهام",
                                                "ג'ייסון סטיית'האם"
                                              ],
                                             profile_path: "/lldeQ91GwIVff43JBrpdbAAeYWj.jpg")
}

struct GenreListResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}


struct MovieDetailResponse: Codable {
    let results: MovieDetail
}

struct MovieDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let release_date: String
    let original_language: String
    let budget: Int
    let revenue: Int
    let runtime: Int
    let status: String
    let vote_average: Double
    
    let poster_path: String?
    var posterURL: URL? {
        if let poster = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}


struct CreditsResponse: Codable{
    let cast: [Cast]
}

struct Cast: Codable, Identifiable{
    let id: Int
    let name: String
    let original_name: String
    let character: String
    
    let profile_path: String?
    var profileURL: URL? {
        if let poster = profile_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        }
        return nil
    }
}

struct CastDetailResponse: Codable {
    let results: CastDetail
}

struct CastDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let biography: String
    let known_for_department: String
    let place_of_birth: String
    let popularity: Double
    let birthday: String
    let also_known_as: [String]
    
    let profile_path: String?
    var profileURL: URL? {
        if let profile = profile_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + profile)
        }
        return nil
    }
}

struct CastImagesResponse: Codable {
    let profiles: [CastImage]
}

struct CastImage: Codable{
    let vote_average: Double
    
    let file_path: String?
    var imageURL: URL? {
        if let filepath = file_path {
            return URL(string: "https://image.tmdb.org/t/p/w500" + filepath)
        }
        return nil
    }
}
