//
//  CategoryDetailsListRepository.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine

protocol CategoryDetailsListRepositoryContract {
    func loadCategoryDetails(id: String) async -> Result<CategroyDetailsListResponse, Error>
}

class CategoryDetailsListRepository: CategoryDetailsListRepositoryContract {

    private let service: CategoryDetailsListServiceContract
    
    init(service: CategoryDetailsListServiceContract = CategoryDetailsListService()) {
        self.service = service
    }
    
    func loadCategoryDetails(id: String) async -> Result<CategroyDetailsListResponse, Error> {
        await service.loadCategoryDetailsList(id: id) // Normally we are doing any cache operation and also we convert from Network Model to Domain Model here
    }
}
