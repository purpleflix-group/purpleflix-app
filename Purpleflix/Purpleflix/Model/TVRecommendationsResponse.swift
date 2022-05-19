//
//  TVRecommendationsResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 19/05/22.
//

import Foundation

struct TVRecommendationsResponse: Decodable {
    var page: Int?
    var results: [TVReponse]?
    var total_pages: Int?
    var total_results: Int?
}
