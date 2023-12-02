//
//  MockFailureCategoryListService.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockFailureCategoryListService: CategoryListServiceContract {
    func loadCategories() async -> Result<CategoryApp.CategoryListResponse, Error> {
        return .failure(NetworkError.invalidURL)
    }
}
