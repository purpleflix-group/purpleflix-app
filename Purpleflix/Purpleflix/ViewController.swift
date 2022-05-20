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
        
//        GeneralRequest.getDetails(url: "https://api.themoviedb.org/3/tv/37") { tv in
//            print(tv?.id)
//            print(tv?.name)
//        }
        TVRequest.getDetailsTV(id: 37)
        
//        TVRequest.getRecommendations(tvId: 2691) { tv in
//            print(tv?.results?.first?.name)
//            print(tv?.results?.last?.name)
//            print(tv?.results?.count)
//        }
    }


}

