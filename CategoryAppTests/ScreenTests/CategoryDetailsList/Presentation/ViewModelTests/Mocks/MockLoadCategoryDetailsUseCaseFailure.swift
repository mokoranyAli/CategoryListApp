//
//  MockLoadCategoryDetailsUseCaseFailure.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation
@testable import CategoryApp

class MockLoadCategoryDetailsUseCaseFailure: LoadCategoryDetailsUseCaseContract {
    func execute(id: String) async -> Result<CategroyDetailsListResponse, Error> {
        .failure(NetworkError.invalidURL)
    }
}
