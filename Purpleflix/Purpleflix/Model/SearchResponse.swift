//
//  SearchResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 21/05/22.
//

import Foundation

struct SearchResponse: Decodable {
    var movieResponses: [MovieResponse]? = []
    var tvResponses: [TVResponse]? = []
    var personResponses: [PersonResponse]? = []
}

struct PersonResponse: Decodable {
    var profile_path: String?
    var id: Int?
    var name: String?
    var popularity: Double?
}
