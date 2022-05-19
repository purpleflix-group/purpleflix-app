//
//  MoviePageResponse.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/05/22.
//

import Foundation

struct MoviePageResponse: Decodable {
    var page: Int?
    var results: [MovieResponse]?
    var total_pages: Int?
    var total_results: Int?
}
