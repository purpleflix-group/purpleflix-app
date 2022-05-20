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
    
    static func getRecommendations(movieID: Int, result: @escaping (_ movies: [MovieResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/recommendations"
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
                var movies: [MovieResponse] = []
                for value in json["results"].arrayValue {
                    let movie = try JSONDecoder().decode(MovieResponse.self, from: value.rawData())
                    movies.append(movie)
                }
                result(movies)
            }
            catch {
                print("[Error][MovieRequest][getRecommendations]: \(error)")
                result(nil)
            }
        }
    }
    
    static func getWatchProvider(movieID: Int, result: @escaping (_ providers: [String:WatchProviderResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/watch/providers"
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
                print("[Error][MovieRequest][getWatchProvider]: \(error)")
                result(nil)
            }
        }
    }
}
