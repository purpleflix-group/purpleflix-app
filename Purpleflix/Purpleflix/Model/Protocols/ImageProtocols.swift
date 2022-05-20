//
//  ImageProtocols.swift
//  Purpleflix
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/05/22.
//

import Foundation

protocol IBackdrop {
    var backdrop_path: String? {get set}
}

protocol ILogo {
    var logo_path: String? {get set}
}

protocol IPoster {
    var poster_path: String? {get set}
}
