//
//  TVRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation
import Alamofire

class TVRequest {
    
    static func getDetails(TVId: Int, result: @escaping (_ tv: TVResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(TVId)"
        GeneralRequest<TVResponse>.getDetails(url: url, result: result)
    }
    
    static func getRecommendations(tvId: Int, result: @escaping (_ tv: [TVResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(tvId)/recommendations"
        GeneralRequest<TVResponse>.getRecommendations(url: url, result: result)
    }
    
    static func getWatchProvider(tvId: Int, result: @escaping (_ providers: [String:WatchProviderResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(tvId)/watch/providers"
        GeneralRequest<WatchProviderResponse>.getWatchProvider(url: url, result: result)
    }
}

