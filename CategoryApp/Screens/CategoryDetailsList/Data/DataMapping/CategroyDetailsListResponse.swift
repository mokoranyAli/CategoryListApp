//
//  CategroyDetailsListResponse.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

// MARK: - CategroyDetailResponse
struct CategroyDetailResponse: Decodable, Hashable {
    let id: Int?
    let title: String?
    let minBudget, maxBudget, avgBudget: Int?
    let image: String?
}

typealias CategroyDetailsListResponse = [CategroyDetailResponse]
