//
//  PurpleflixTests.swift
//  PurpleflixTests
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/05/22.
//

import XCTest
@testable import Purpleflix

class PurpleflixTests: XCTestCase {
    
    let movieID = 550

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageRequestGetBackdrop() {
        var image: UIImage?
        let expectation = expectation(description: "MovieDetails")
        MovieRequest.getDetails(movieID: movieID) { movie in
            XCTAssertNotNil(movie)
            guard let movie = movie else { return }
            ImageRequest.getBackdrop(from: movie, backDropSize: .original) { backDrop in
                image = backDrop
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(image)
    }

    func testImageRequestGetPoster() {
        var image: UIImage?
        let expectation = expectation(description: "MovieDetails")
        MovieRequest.getDetails(movieID: movieID) { movie in
            XCTAssertNotNil(movie)
            guard let movie = movie else { return }
            ImageRequest.getPoster(from: movie, posterSize: .original) { poster in
                image = poster
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(image)
    }
    
    func testImageRequestGetLogo() {
        var image: UIImage?
        let expectation = expectation(description: "MovieDetails")
        MovieRequest.getWatchProvider(movieID: movieID) { providers in
            XCTAssertNotNil(providers)
            XCTAssertNotNil(providers?["BR"]?.flatrate?.first)
            guard let provider = providers?["BR"]?.flatrate?.first else { return }
            ImageRequest.getLogo(from: provider, logoSize: .original) { logo in
                image = logo
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(image)
    }

}
