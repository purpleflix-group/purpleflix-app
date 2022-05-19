//
//  MovieResponse.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/05/22.
//

import Foundation

struct MovieResponse: Decodable{
    var backdrop_path: String?
    var budget: Int?
    var genres: [GenresResponse]?
}

struct GenresResponse: Decodable {
    var id: Int?
    var name: String?
}
