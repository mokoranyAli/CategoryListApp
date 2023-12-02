//
//  CategoryListViewModel.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine
import Foundation

final class CategoryListViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var categories: CategoryListResponse = []
    private let loadCategoriesUseCase: LoadCategoriesUseCaseeContract
    @Published var sharedViewmodel: SharedViewModel = .init()

    // MARK: - Init
    init(loadCategoriesUseCase: LoadCategoriesUseCaseeContract = LoadCategoriesUseCase()) {
        self.loadCategoriesUseCase = loadCategoriesUseCase
        super.init()
        loadData()
        sharedViewmodel.$selectedItems.receive(on: DispatchQueue.main).sink { _ in
            self.objectWillChange.send()
        }.store(in: &cancellables)
    }
    
    // MARK: - Handlers
    private func loadData() {
        Task {
            state = .loading
            let result = await loadCategoriesUseCase.execute()
            await MainActor.run {
                switch result {
                case .success(let list):
                    categories = list
                    state = .success
                case .failure(let error):
                    state = .failure(error)
                    alertItem = state.alertItem
                }
            }
        }
    }
}
