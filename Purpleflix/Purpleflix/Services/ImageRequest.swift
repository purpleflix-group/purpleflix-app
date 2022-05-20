//
//  ImageRequest.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import Foundation
import Alamofire
import UIKit

class ImageRequest {
    
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
