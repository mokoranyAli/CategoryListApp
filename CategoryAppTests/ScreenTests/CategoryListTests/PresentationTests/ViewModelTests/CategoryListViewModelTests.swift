//
//  CategoryListViewModelTests.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
import Combine
@testable import CategoryApp

class CategoryListViewModelTests: XCTestCase {
    private var sut: CategoryListViewModel!
    
    override func setUp() {
        super.setUp()
        sut = .init(loadCategoriesUseCase: MockLoadCategoriesUseCaseSuccess())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataWithSuccess_stateShouldBeSuccess() {
        // Given
        let expectation = self.expectation(description: "Loading Categories Successfully")
        var expectedState: ViewModelState!
        
        // When Init
        
        sut.$state.sink { state in
            if case .success = state {
                expectedState = state
                expectation.fulfill()
            }
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        
        // Then
        XCTAssertEqual(expectedState, .success)
    }
    
    
    func testSUT_whenExecuteFailure_stateShouldBeFailure() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedState: ViewModelState!
       
        // When
        sut = .init(loadCategoriesUseCase: MockLoadCategoriesUseCaseFailure())
        
        sut.$state.sink { state in
            if case .failure = state {
                expectedState = state
                expectation.fulfill()
            }
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 2.0)
        
        // Then
        XCTAssertEqual(expectedState, .failure(NetworkError.invalidResponse))
    }
}
