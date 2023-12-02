//
//  MockCategoryDetailsListRepositoryFailure.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockCategoryDetailsListRepositoryFailure: CategoryDetailsListRepositoryContract {
    func loadCategoryDetails(id: String) async -> Result<CategoryApp.CategroyDetailsListResponse, Error> {
        .failure(NetworkError.invalidURL)
    }
}
