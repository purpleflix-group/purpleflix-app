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
        
        MovieRequest.getWatchProvider(movieID: 550) { providers in
            print(providers?["BR"])
        }
        
        TVRequest.getDetails(TVid: 37) { tv in
            print(tv?.name)
        }
        
//        TVRequest.getRecommendations(tvId: 2691) { tv in
//            print(tv?.results?.first?.name)
//            print(tv?.results?.last?.name)
//            print(tv?.results?.count)
//        }
    }
}

