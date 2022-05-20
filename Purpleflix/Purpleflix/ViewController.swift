//
//  ViewController.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
//        MovieRequest.getDetails(movieID: 550) { movie in
//            guard let movie = movie else {
//                print("Could not get movie")
//                return
//            }
//            
//            print(movie)
//        }
        
        MovieRequest.getRecommendations(movieID: 550) { movie in
            print(movie)
        }
    }
}

