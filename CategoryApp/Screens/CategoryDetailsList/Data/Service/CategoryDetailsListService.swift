//
//  CategoryDetailsListService.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

protocol CategoryDetailsListServiceContract {
    func loadCategoryDetailsList(id: String) async -> Result<CategroyDetailsListResponse, Error>
}

class CategoryDetailsListService: CategoryDetailsListServiceContract {
    
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadCategoryDetailsList(id: String) async -> Result<CategroyDetailsListResponse, Error> {
         let baseURL = Environment.baseURL
        guard  let url = URL(string: baseURL + Path.categories + id + ".json") else {
           return .failure(NetworkError.invalidURL)
       }
        
        return await apiService.request(url)
    }
}

private extension CategoryDetailsListService {
    enum Path {
        static let categories = "/categories/"
    }
}
