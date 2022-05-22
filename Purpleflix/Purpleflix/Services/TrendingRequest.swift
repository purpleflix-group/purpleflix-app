//
//  TrendingRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 22/05/22.
//

import Foundation
import Alamofire

class TrendingRequest {
    enum MediaType: String {
        case all // Include all movies, TV shows and people in the results as a global trending list.
        case movie // Show the trending movies in the results.
        case tv // Show the trending TV shows in the results.
        case person // Show the trending people in the results.
    }
    
    enum TimeWindow: String {
        case day // View the trending list for the day.
        case weak // View the trending list for the week.
    }
    
    static func getTrending(mediaType: MediaType, timeWindow: TimeWindow, result: @escaping (_ trending: TrendingResponse?) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/\(mediaType.rawValue)/\(timeWindow.rawValue)"
        let parameters = ["api_key": ApiKey.themoviedbkey]
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingResponse.self) { response in
            result(response.value)
        }
    }
}
