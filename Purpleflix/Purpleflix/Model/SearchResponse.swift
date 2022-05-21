//
//  SearchResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 21/05/22.
//

import Foundation

struct SearchResponse: Decodable {
    var movieResponse: [MovieResponse]?
    var tvResponse: [TVResponse]?
    var personResponse: [PersonResponse]?
}

struct PersonResponse: Decodable {
    var profile_path: String?
    var id: Int?
    var name: String?
    var popularity: Double?
}
