//
//  MockSuccessCategoryListRepository.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockSuccessCategoryListRepository: CategoryListRepositoryContract {
    func loadCategories() async -> Result<CategoryApp.CategoryListResponse, Error> {
        return .success(MockData.categoryListResponse)
    }
}
