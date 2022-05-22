//
//  TrendingResponse.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 22/05/22.
//

import Foundation

struct TrendingResponse: Decodable, IPoster {
    var id: Int?
    var poster_path: String?
    var overview: String?
    var release_date: String?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var vote_average: Double?
}
