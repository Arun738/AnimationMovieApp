//
//  MainViewTest.swift
//  MovieAppTests
//
//  Created by Arun Tiwari on 14/05/25.
//

import XCTest
@testable import MovieApp

final class MainViewModelTests: XCTestCase {

    var viewModel: MainViewModel!

    override func setUpWithError() throws {
        viewModel = MainViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testGetData_populatesCellDataSource() {
        // Arrange
        let expectation = self.expectation(description: "Movies Loaded")

        viewModel.cellDataSource.bind { movies in
            if let movies = movies, !movies.isEmpty {
                expectation.fulfill()
            }
        }

        // Act
        viewModel.getData()

        // Assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(viewModel.cellDataSource.value?.isEmpty ?? true)
    }

   

    func testRetriveMovie_returnsCorrectMovie() {
        // Arrange
        let expectation = self.expectation(description: "Movie Retrieved")

        viewModel.cellDataSource.bind { movies in
            if let movies = movies, !movies.isEmpty {
                expectation.fulfill()
            }
        }

        viewModel.getData()
        wait(for: [expectation], timeout: 5.0)

        // Act
        guard let movie = viewModel.dataSource?.results?.first,
              let movieIdStr = movie.id,
              let movieId = Int(movieIdStr) else {
            XCTFail("No movie to retrieve")
            return
        }

        let retrieved = viewModel.retriveMovie(with: movieId)

        // Assert
        XCTAssertNotNil(retrieved)
        XCTAssertEqual(retrieved?.id, movie.id)
    }
}
