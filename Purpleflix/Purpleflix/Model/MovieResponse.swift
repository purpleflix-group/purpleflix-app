//
//  MovieResponse.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/05/22.
//

import Foundation

struct MovieResponse: Decodable {
    var backdrop_path: String?
    var budget: Int?
    var genres: [GenresResponse]
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String? //Sinopse
    var popularity: Double?
    var poster_path: String?
    var revenue: Int?
    var runtime: Int? //Duração do filme em minutos
    var tagline: String? //Resumo
    var title: String?
    var vote_average: Double?
}

struct GenresResponse: Decodable {
    var id: Int
    var name: String
}
