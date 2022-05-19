//
//  TVResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 19/05/22.
//

import Foundation

struct TVReponse: Decodable {
    var created_By: [Created_by]?
    var genres: [Genres]?
    
    var id: Int?
    var languages: [String]?
    var name: String?
    var number_of_episodes: Int?
    var number_of_seasons: Int?
    var origin_country: [String]?
    var overview: String?
    var vote_average: Double?
}

struct Created_by: Decodable {
    var name: String?
    var profile_path: String?
}

struct Genres: Decodable {
    var id: Int?
    var name: String?
}
