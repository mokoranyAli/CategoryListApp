//
//  LoadCategoriesUseCase.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

protocol LoadCategoriesUseCaseeContract {
    func execute() async -> Result<CategoryListResponse, Error>
}

class LoadCategoriesUseCase: LoadCategoriesUseCaseeContract {

    private let repository: CategoryListRepositoryContract
    
    init(repository: CategoryListRepositoryContract = CategoryListRepository()) {
        self.repository = repository
    }
    
    func execute() async -> Result<CategoryListResponse, Error> {
       await repository.loadCategories()
    }
}
