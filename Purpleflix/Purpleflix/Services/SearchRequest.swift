//
//  SearchRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation
import Alamofire

class SearchRequest {
    
    static func getSearch(search: String, result: @escaping (_ search: SearchResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/search/multi"
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR",
            "query": search
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: SearchResponse.self) { response in
            guard let data = response.data else {
                result(nil)
                return
            }
            do {
                let json = try JSON(data: data)
                var searchResponse = SearchResponse()
                for value in json["results"].arrayValue {
                    guard let mediaType = value["media_type"].string else { continue }
                    //print(mediaType)
                    if mediaType == "movie" {
                        let movie = try JSONDecoder().decode(MovieResponse.self, from: value.rawData())
                        print(movie.title)
                        searchResponse.movieResponses?.append(movie)
                    }
                    
                    
                }
                result(searchResponse)
            }
            catch {
                print("[Error][GeneralRequest][getSearch]: \(error)")
                result(nil)
            }
        }
    }
}
