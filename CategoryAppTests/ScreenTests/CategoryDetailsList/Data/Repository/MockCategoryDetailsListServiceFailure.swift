//
//  MockCategoryDetailsListServiceFailure.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockCategoryDetailsListServiceFailure: CategoryDetailsListServiceContract {
    func loadCategoryDetailsList(id: String) async -> Result<CategoryApp.CategroyDetailsListResponse, Error> {
        .failure(NetworkError.invalidURL)
    }
}
