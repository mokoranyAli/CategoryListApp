//
//  CategoryDetailsViewModelTests.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
import Combine
@testable import CategoryApp

class CategoryDetailsViewModelTests: XCTestCase {
    private var sut: CategoryDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = .init(title: "Stuff", categoryID: 1, sharedViewModel: .init(), loadCategoryDetailssUseCase: MockLoadCategoryDetailsUseCaseSuccess())
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
    
    
    func testSUT_whenExecuteFailure_stateShouldBeInvalidURLFailure() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedState: ViewModelState!
        expectation.assertForOverFulfill = false
        
        // When
        sut = .init(title: "Stuff", categoryID: 1, sharedViewModel: .init(), loadCategoryDetailssUseCase: MockLoadCategoryDetailsUseCaseFailure())
        
        sut.$state.sink { state in
            if case .failure = state {
                expectedState = state
                expectation.fulfill()
            }
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertEqual(expectedState, .failure(NetworkError.invalidURL))
    }
    
    func testSUT_displayedPrice_shouldBeDash() {
        
        // Then
        XCTAssertEqual(sut.displayedPrice, "-")
    }
}
