//
//  TVResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 20/05/22.
//

import Foundation

struct TVResponse: Decodable {
    var created_by: [Created_by]?
    var genres: [Genres]?
    
    var id: Int?
    var languages: [String]?
    var name: String?
    var number_of_episodes: Int?
    var number_of_seasons: Int?
    var origin_country: [String]?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var vote_average: Double?
}

struct Created_by: Decodable {
    var id: Int?
    var name: String?
}

struct Genres: Decodable {
    var id: Int?
    var name: String?
}
