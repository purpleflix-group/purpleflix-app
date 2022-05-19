//
//  TVRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Alamofire

class TVRequest {
    
    static func getDetails(tvId: Int, result: @escaping (_ tv: TVReponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(tvId)"
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: TVReponse.self) { response in
            result(response.value)
        }
    }
    
    static func getRecommendations(tvId: Int, result: @escaping (_ tv: TVRecommendationsResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(tvId)/recommendations"
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: TVRecommendationsResponse.self) { response in
            result(response.value)
        }
    }
}
