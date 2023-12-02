//
//  MockCategoryDetailsListRepositorySuccess.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockCategoryDetailsListRepositorySuccess: CategoryDetailsListRepositoryContract {
    func loadCategoryDetails(id: String) async -> Result<CategoryApp.CategroyDetailsListResponse, Error> {
        .success(MockData.categoryDetailsListResponse)
    }
}
