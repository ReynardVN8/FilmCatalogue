//
//  DiscoverViewModelTests.swift
//  FilmCatalogueTests
//
//  Created by ReynardVN8 on 17/10/23.
//

import XCTest
@testable import FilmCatalogue

class DiscoverViewModelTests: XCTestCase {
    let screen = DiscoverScreen()
    let viewModel = DiscoverViewModel()

    override func setUp() {
        super.setUp()
        viewModel.currentGenre = 28
        viewModel.movieListHeaders = MovieListHeaders([])
        viewModel.genreHeaders = GenreHeaders([])
    }

    func testLoadingGenres() {
        XCTAssertNotNil(viewModel.getGenres())
        guard let genres = viewModel.genre else {
            return
        }
        XCTAssert("\(genres)".contains("Action"))
        XCTAssert("\(genres)".contains("Horror"))
        XCTAssert("\(genres)".contains("Drama"))
        XCTAssert("\(genres)".contains("Mystery"))
    }
    
    func testLoadingMoviesBasedOnGenres(){
        XCTAssertNotNil(viewModel.getMoviesByGenre())
    }
}
