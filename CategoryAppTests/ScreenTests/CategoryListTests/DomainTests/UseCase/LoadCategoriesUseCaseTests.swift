//
//  LoadCategoriesUseCaseTests.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
@testable import CategoryApp

class LoadCategoriesUseCaseTests: XCTestCase {
    
    private var sut: LoadCategoriesUseCase!
    
    override func setUp() {
        super.setUp()
        sut = .init(repository: MockSuccessCategoryListRepository())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetOneItemWith123ID() async {
        do {
            // When
            let expectedItems = try await sut.execute().get()
            
            // Then
            XCTAssertEqual(expectedItems.count, 1)
            XCTAssertEqual(expectedItems.first?.id, 123)
        } catch {
            XCTFail("Failed")
        }
    }
    
    func testSUT_whenFailToLoadData_shouldGetInvalidResponseError() async {
        // Given
        sut = .init(repository: MockFailureCategoryListRepository())
        
            // When
            let result = await sut.execute()
            guard case .failure(let failure) = result else {
                XCTFail()
                return
            }
            // Then
            let error = failure as? NetworkError
            XCTAssertEqual(error, NetworkError.invalidResponse)
            
    }
}
