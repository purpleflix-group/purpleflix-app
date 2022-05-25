//
//  SearchRequest.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 21/05/22.
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
                    
                    if mediaType == "movie" {
                        let movie = try JSONDecoder().decode(MovieResponse.self, from: value.rawData())
                        searchResponse.movieResponses?.append(movie)
                        
                    }else if mediaType == "person" {
                        let person = try JSONDecoder().decode(PersonResponse.self, from: value.rawData())
                        searchResponse.personResponses?.append(person)
                        
                    }else if mediaType == "tv" {
                        let tv = try JSONDecoder().decode(TVResponse.self, from: value.rawData())
                        searchResponse.tvResponses?.append(tv)
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
