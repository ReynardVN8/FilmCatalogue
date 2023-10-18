//
//  MovieViewModelTests.swift
//  FilmCatalogueTests
//
//  Created by ReynardVN8 on 17/10/23.
//

import XCTest
@testable import FilmCatalogue

class MovieViewModelTests: XCTestCase {
    let screen = MovieScreen()
    let viewModel = MovieViewModel()

    override func setUp() {
        super.setUp()
        viewModel.movieDetails = []
        viewModel.movieType = .NowPlaying
    }

    func testLoadingMovies() {
        XCTAssertNotNil(viewModel.getMovies())
        
    }
}
