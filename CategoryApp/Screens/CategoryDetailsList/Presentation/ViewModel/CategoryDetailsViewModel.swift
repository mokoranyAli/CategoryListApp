//
//  CategoryDetailsViewModel.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine

class CategoryDetailsViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var categoryItems: CategroyDetailsListResponse = []
    
    private let loadCategoryDetailssUseCase: LoadCategoryDetailsUseCaseContract
    private let categoryID: Int
    private(set) var title: String
    @Published var sharedViewmodel: SharedViewModel
    
    // MARK: - Init
    init(title: String,
         categoryID: Int,
         sharedViewModel: SharedViewModel,
         loadCategoryDetailssUseCase: LoadCategoryDetailsUseCaseContract = LoadCategoryDetailsUseCase()
    ) {
        self.loadCategoryDetailssUseCase = loadCategoryDetailssUseCase
        self.categoryID = categoryID
        self.title = title
        self.sharedViewmodel = sharedViewModel
        super.init()
        loadData()
        setupSelectedCategoriesBinding()
    }
    
    // MARK: - Handlers
    
    private func setupSelectedCategoriesBinding() {
        sharedViewmodel.$selectedItems.sink { items in
            self.sharedViewmodel.selectedCategories[self.categoryID] = items.filter{ self.categoryItems.contains($0) }.count
        }.store(in: &cancellables)
    }
    
    var displayedPrice: String {
        let price = sharedViewmodel.selectedItems.filter{ categoryItems.contains($0) }.compactMap { $0.avgBudget }.reduce(0, +)
        return price > .zero ? "$" + String(price) : "-"
    }
    
    
    private func loadData() {
        Task {
            state = .loading
            let result = await loadCategoryDetailssUseCase.execute(id: String(categoryID))
            await MainActor.run {
                switch result {
                case .success(let list):
                    categoryItems = list
                    state = .success
                case .failure(let error):
                    state = .failure(error)
                    alertItem = state.alertItem
                }
            }
        }
    }
}
