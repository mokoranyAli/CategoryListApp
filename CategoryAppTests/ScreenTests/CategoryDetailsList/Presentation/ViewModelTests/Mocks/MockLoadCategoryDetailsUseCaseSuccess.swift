//
//  MockLoadCategoryDetailsUseCaseSuccess.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockLoadCategoryDetailsUseCaseSuccess: LoadCategoryDetailsUseCaseContract {
    func execute(id: String) async -> Result<CategroyDetailsListResponse, Error> {
        .success(MockData.categoryDetailsListResponse)
    }
}
