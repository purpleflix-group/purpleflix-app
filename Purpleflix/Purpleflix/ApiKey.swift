//
//  ApiKey.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation

struct ApiKey{
    
    static var themoviedbkey: String {
        return Bundle.main.object(forInfoDictionaryKey: "ThemoviedbApiKey") as! String
    }
    
}
