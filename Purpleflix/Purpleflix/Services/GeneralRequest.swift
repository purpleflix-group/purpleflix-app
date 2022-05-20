//
//  GeneralRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/05/22.
//

import Foundation
import Alamofire
import UIKit

class GeneralRequest<T: Decodable> {

    enum BackdropSizes: String {
        case w300 = "w300"
        case w780 = "w780"
        case w1280 = "w1280"
        case original = "original"
    }
    
    enum LogoSizes: String {
        case w45 = "w45"
        case w92 = "w92"
        case w154 = "w154"
        case w185 = "w185"
        case w300 = "w300"
        case w500 = "w500"
        case original = "original"
    }
    
    enum PosterSizes: String {
        case w92 = "w92"
        case w154 = "w154"
        case w185 = "w185"
        case w342 = "w342"
        case w500 = "w500"
        case w780 = "w780"
        case original = "original"
    }
    
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
    
    static func getBackdrop(backDropSize: BackdropSizes, imagePath: String, result: @escaping (_ backDrop: UIImage?) -> Void) {
        getImage(imageSize: backDropSize.rawValue, imagePath: imagePath, result: result)
    }
    
    private static func getImage(imageSize: String, imagePath: String, result: @escaping (_ image: UIImage?) -> Void) {
        let url = "http://image.tmdb.org/t/p/\(imageSize)/\(imagePath)"
        AF.request(url).response { response in
            guard let data = response.data else {
                result(nil)
                return
            }
            result(UIImage(data: data))
        }
    }
    
}
