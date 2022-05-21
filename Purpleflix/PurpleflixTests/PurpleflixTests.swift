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

    func testImageRequestGetBackdrop() throws {
        var image: UIImage?
        let expectation = expectation(description: "MovieDetails")
        MovieRequest.getDetails(movieID: movieID) { movie in
            XCTAssertNotNil(movie)
            guard let movie = movie else { return }
            ImageRequest.getBackdrop(for: movie, backDropSize: .original) { backDrop in
                image = backDrop
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10)
        XCTAssertNotNil(image)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            print("Hello WOrld")
        }   
    }

}
