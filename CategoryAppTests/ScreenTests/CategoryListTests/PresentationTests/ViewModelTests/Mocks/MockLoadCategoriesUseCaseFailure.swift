//
//  MockLoadCategoriesUseCaseFailure.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockLoadCategoriesUseCaseFailure: LoadCategoriesUseCaseeContract {
    func execute() async -> Result<CategoryListResponse, Error> {
        return .failure(NetworkError.invalidResponse)
    }
}
