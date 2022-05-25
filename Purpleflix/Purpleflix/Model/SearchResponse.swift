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
