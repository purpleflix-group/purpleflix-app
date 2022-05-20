//
//  GeneralRequest.swift
//  Purpleflix
//
//  Created by Gustavo da Silva Braghin on 20/05/22.
//

import Foundation
import Alamofire

class GeneralRequest {
    
    static func getDetails<T: Decodable>(url: String, result: @escaping (_ tv: T?) -> Void) {
        let parameters = [
            "api_key": ApiKey.themoviedbkey,
            "language": "pt-BR"
        ]
        AF.request(url, parameters: parameters).responseDecodable(of: T.self) { response in
            result(response.value)
        }
    }
    
//    static func getDetails(tvId: Int, result: @escaping (_ tv: TVReponse?) -> Void) {
//        let url = "https://api.themoviedb.org/3/tv/\(tvId)"
//        let parameters = [
//            "api_key": ApiKey.themoviedbkey,
//            "language": "pt-BR"
//        ]
//        AF.request(url, parameters: parameters).responseDecodable(of: TVReponse.self) { response in
//            result(response.value)
//        }
//    }
}
