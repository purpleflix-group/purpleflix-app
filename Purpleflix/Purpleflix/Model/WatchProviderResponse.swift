//
//  ProviderResponse.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/05/22.
//

import Foundation

struct WatchProviderResponse: Decodable {
    var flatrate: [ProviderResponse]?
    var rent: [ProviderResponse]?
    var buy: [ProviderResponse]?
    
    struct ProviderResponse: Decodable, ILogo {
        var logo_path: String?
        var provider_name: String?
    }
}
