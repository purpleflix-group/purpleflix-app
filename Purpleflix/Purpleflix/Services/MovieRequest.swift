//
//  MovieRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation
import Alamofire

class MovieRequest {
    
    static func getDetails(movieID: Int, result: @escaping (_ movie: MovieResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)"
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: MovieResponse.self) { response in
            result(response.value)
        }
    }
    
    static func getRecommendations(movieID: Int, page: Int? = nil, result: @escaping (_ movie: MoviePageResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/recommendations"
        var parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        if let page = page {
           parameters["page"] = "\(page)"
        }
        AF.request(url, parameters: parameters).responseDecodable(of: MoviePageResponse.self) { response in
            result(response.value)
        }
    }
    
}
