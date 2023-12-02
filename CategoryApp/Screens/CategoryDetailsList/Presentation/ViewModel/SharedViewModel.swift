//
//  SharedViewModel.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine

class SharedViewModel: BaseViewModel {
    @Published var selectedItems: CategroyDetailsListResponse = []
    var priceAsString: String {
        return price > .zero ? "$" + String(price) : "-"
    }
    
    var price: Int {
        selectedItems.compactMap { $0.avgBudget }.reduce(0, +)
    }
    
    @Published var selectedCategories: [Int: Int] = [:]
}
