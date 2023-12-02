//
//  CategoryListResponse.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

// MARK: - CategoryResponse
struct CategoryResponse: Decodable, Hashable {
    let id: Int?
    let title: String?
    let image: String?
}

typealias CategoryListResponse = [CategoryResponse]
