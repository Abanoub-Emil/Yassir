//
//  YassirTests.swift
//  YassirTests
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import XCTest
@testable import Yassir

final class YassirTests: XCTestCase {

    var moviesListViewModel: MoviesListViewModel?
    
    override func setUp() {
        super.setUp()
        moviesListViewModel = MoviesListViewModel(moviesListService: ServiceProtocolMock())
        moviesListViewModel?.setTestMovie()
    }
    
    override func tearDown() {
        moviesListViewModel = nil
        super.tearDown()
    }
    
    
    func test_didSelectMovie() {
        moviesListViewModel?.didSelectMovie(index: 0)
        if case let .movieDetails(movie) = moviesListViewModel?.navigate.value {
            XCTAssertEqual(movie.id, Movie.testMovie.id)
        } else {
            XCTFail("Coruppted Data")
        }
    }

}
