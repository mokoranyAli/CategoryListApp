//
//  MockData.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//


import Foundation
@testable import CategoryApp

struct MockData {
    
    static let categoryListResponse: CategoryListResponse =  {
        [.init(id: 123, title: "Item", image: "URL")]
    }()
    
    
    static let categoryDetailsListResponse: CategroyDetailsListResponse =  {
        [.init(id: 123, title: "Item", minBudget: 5, maxBudget: 10, avgBudget: 7, image: "URL")]
    }()
}
