//
//  CategoryListRepository.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine

protocol CategoryListRepositoryContract {
    func loadCategories() async -> Result<CategoryListResponse, Error>
}

class CategoryListRepository: CategoryListRepositoryContract {

    private let service: CategoryListServiceContract
    
    init(service: CategoryListServiceContract = CategoryListService()) {
        self.service = service
    }
    
    func loadCategories() async -> Result<CategoryListResponse, Error> {
        await service.loadCategories() // Normally we are doing any cache operation and also we convert from Network Model to Domain Model here
    }
}
