//
//  MovieInfoViewModelTests.swift
//  FilmCatalogueTests
//
//  Created by ReynardVN8 on 17/10/23.
//

import XCTest
import SwiftyJSON
@testable import FilmCatalogue

class MovieInfoViewModelTests: XCTestCase {
    let screen = MovieInfoScreen(id: 926393)
    let viewModel = MovieInfoViewModel()
    var movieDetail = MovieDetail([])

    override func setUp() {
        super.setUp()
    }

    func testLoadingMovieDetails() {
        XCTAssertNotNil(viewModel.getDetailedMovie())
        guard let movieInfo = viewModel.movieInfo else {
            return
        }
        
        XCTAssertTrue("\(movieInfo)".contains("926393"))
        XCTAssertTrue("\(movieInfo)".contains("The Equalizer 3"))
        XCTAssertTrue("\(movieInfo)".contains("/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg"))
        XCTAssertTrue("\(movieInfo)".contains("/cHNqobjzfLj88lpIYqkZpecwQEC.jpg"))
    }
    
    func testLoadingTrailers(){
        XCTAssertNotNil(viewModel.getTrailer())
        guard let youtubeKey = viewModel.youtubeKey else {
            return
        }
        XCTAssertTrue("\(youtubeKey)".contains("19ikl8vy4zs"))
    }
    
    func testGetUserReviews(){
        XCTAssertNotNil(viewModel.getReview(page: 1))
    }

}
