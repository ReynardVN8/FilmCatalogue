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
        viewModel.genre = [Genre]()
        viewModel.movieListHeaders = MovieListHeaders([])
        viewModel.genreHeaders = GenreHeaders([])
    }

    func testLoadingGenres() {
        XCTAssertNotNil(viewModel.getGenres())
    }
    
    func testLoadingMoviesBasedOnGenres(){
        XCTAssertNotNil(viewModel.getMoviesByGenre())
    }
}
