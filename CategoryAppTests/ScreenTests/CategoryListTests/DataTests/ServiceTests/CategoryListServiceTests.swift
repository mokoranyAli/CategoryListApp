//
//  CategoryListServiceTests.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
@testable import CategoryApp

class CategoryListServiceTests: XCTestCase {
    
    private var sut: CategoryListService!
    
    override func setUp() {
        super.setUp()
        sut = .init(apiService: MockAPIService(fileName: "CategoryList"))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetFourElements() async {
        do {
            // When
            let expectedItems = try await sut.loadCategories().get()
            
            // Then
            XCTAssertEqual(expectedItems.count, 4)
        } catch {
            XCTFail("Failed")
        }
    }
    
    func testSUT_whenInvalidURL_shouldGetError() async {
        // Given
        sut = .init(apiService: MockAPIService(fileName: "Wrong Name"))
        
        // When
        let result = await sut.loadCategories()
        guard case .failure(let failure) = result else {
            XCTFail()
            return
        }
        // Then
        let error = failure as? NetworkError
        XCTAssertEqual(error, NetworkError.invalidURL)
        
    }
}

