//
//  GeneralRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/05/22.
//

import Foundation
import Alamofire

class GeneralRequest<T: Decodable> {
    
    static func getDetails(url: String, result: @escaping (_ movie: T?) -> Void) {
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: T.self) { response in
            result(response.value)
        }
    }
    
    static func getRecommendations(url: String, result: @escaping (_ movies: [T]?) -> Void) {
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).response { response in
            guard let data = response.data else {
                result(nil)
                return
            }
            do {
                let json = try JSON(data: data)
                var responses: [T] = []
                for value in json["results"].arrayValue {
                    let movie = try JSONDecoder().decode(T.self, from: value.rawData())
                    responses.append(movie)
                }
                result(responses)
            }
            catch {
                print("[Error][GeneralRequest][getRecommendations]: \(error)")
                result(nil)
            }
        }
    }
    
    static func getWatchProvider(url: String, result: @escaping (_ providers: [String:WatchProviderResponse]?) -> Void) {
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).response { response in
            guard let data = response.data else {
                result(nil)
                return
            }
            do {
                let json = try JSON(data: data)
                var providers: [String: WatchProviderResponse] = [:]
                for value in json["results"] {
                    providers[value.0] = try JSONDecoder().decode(WatchProviderResponse.self, from: value.1.rawData())
                }
                result(providers)
            }
            catch {
                print("[Error][GeneralRequest][getWatchProvider]: \(error)")
                result(nil)
            }
        }
    }
    
}
