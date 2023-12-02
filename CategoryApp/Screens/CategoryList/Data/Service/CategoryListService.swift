//
//  CategoryListService.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

protocol CategoryListServiceContract {
    func loadCategories() async -> Result<CategoryListResponse, Error>
}

class CategoryListService: CategoryListServiceContract {
    
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadCategories() async -> Result<CategoryListResponse, Error> {
         let baseURL = Environment.baseURL
        guard  let url = URL(string: baseURL + Path.categories) else {
           return .failure(NetworkError.invalidURL)
       }
        
        return await apiService.request(url)
    }
}

private extension CategoryListService {
    enum Path {
        static let categories = "/categories.json"
    }
}
