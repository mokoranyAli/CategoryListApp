//
//  CategoryDetailsListRepositoryTests.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
@testable import CategoryApp

class CategoryDetailsListRepositoryTests: XCTestCase {
    
    private var sut: CategoryDetailsListRepository!
    
    override func setUp() {
        super.setUp()
        sut = .init(service: MockCategoryDetailsListServiceSuccess())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetOneItemWith123ID() async {
        do {
            // When
            let expectedItems = try await sut.loadCategoryDetails(id: " ").get()
            
            // Then
            XCTAssertEqual(expectedItems.count, 1)
            XCTAssertEqual(expectedItems.first?.id, 123)
        } catch {
            XCTFail("Failed")
        }
    }
    
    func testSUT_whenFailToLoadData_shouldGetError() async {
        // Given
        sut = .init(service: MockCategoryDetailsListServiceFailure())
        
            // When
            let result = await sut.loadCategoryDetails(id: "")
            guard case .failure(let failure) = result else {
                XCTFail()
                return
            }
            // Then
            let error = failure as? NetworkError
            XCTAssertEqual(error, NetworkError.invalidURL)
            
    }
}
