//
//  LoadCategoryDetailsUseCase.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

protocol LoadCategoryDetailsUseCaseContract {
    func execute(id: String) async -> Result<CategroyDetailsListResponse, Error>
}

class LoadCategoryDetailsUseCase: LoadCategoryDetailsUseCaseContract {

    private let repository: CategoryDetailsListRepositoryContract
    
    init(repository: CategoryDetailsListRepositoryContract = CategoryDetailsListRepository()) {
        self.repository = repository
    }
    
    func execute(id: String) async -> Result<CategroyDetailsListResponse, Error> {
       await repository.loadCategoryDetails(id: id)
    }
}
