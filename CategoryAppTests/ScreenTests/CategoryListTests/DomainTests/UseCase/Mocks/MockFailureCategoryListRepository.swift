//
//  MockFailureCategoryListRepository.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockFailureCategoryListRepository: CategoryListRepositoryContract {
    func loadCategories() async -> Result<CategoryApp.CategoryListResponse, Error> {
        return .failure(NetworkError.invalidResponse)
    }
}
