//
//  PersonResponse.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 24/05/22.
//

import Foundation

struct PersonResponse: Decodable {
    var profile_path: String?
    var adult: Bool?
    var id: Int?
    var media_tyoe: String?
}
