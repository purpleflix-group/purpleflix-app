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
        GeneralRequest<MovieResponse>.getDetails(url: url, result: result)
    }
    
    static func getRecommendations(movieID: Int, result: @escaping (_ movies: [MovieResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/recommendations"
        GeneralRequest<MovieResponse>.getRecommendations(url: url, result: result)
    }
    
    static func getWatchProvider(movieID: Int, result: @escaping (_ providers: [String:WatchProviderResponse]?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/watch/providers"
        GeneralRequest<MovieResponse>.getWatchProvider(url: url, result: result)
    }
}
