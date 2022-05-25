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
//        MovieRequest.getWatchProvider(movieID: 550) { providers in
//            print(providers?["BR"])
//        }
//        
//        TVRequest.getWatchProvider(tvId: 34) { providers in
//            print(providers?["BR"])
//        }
        
        SearchRequest.getSearch(search: "Leonardo") { search in
            print("Title: \(search?.movieResponses?.first?.title) ")
            print("Person: \(search?.personResponses?.first?.id)")
            print("Tv: \(search?.tvResponses?.first?.name)")
        }
    }
}

