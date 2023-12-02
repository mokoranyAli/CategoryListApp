//
//  MockLoadCategoriesUseCaseSuccess.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockLoadCategoriesUseCaseSuccess: LoadCategoriesUseCaseeContract {
    func execute() async -> Result<CategoryListResponse, Error> {
        return .success(MockData.categoryListResponse)
    }
}
