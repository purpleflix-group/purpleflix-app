//
//  MovieRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation
import Alamofire

class MovieRequest: GeneralRequest {
    
    static func getDetails(movieID: Int, result: @escaping (_ movie: MovieResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)"
        super.getDetails(url: url, type: MovieResponse.self, result: result)
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
        getWatchProvider(url: url, result: result)
    }
}
