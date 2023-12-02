//
//  CategoryListCoordinator.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import UIKit
import SwiftUI

final class CategoryListCoordinator: CategoryListCoordinatorProtocol {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    
    func start() {
        showCategoryListViewController()
    }
    
    private func showCategoryListViewController() {
        let view = SplashScreenView(coordinator: self)
        let viewController = UIHostingController(rootView: view)
        self.navigationController.setViewControllers([viewController], animated: false)
    }
}

// MARK: - Default implementation for Category list navigation
//
protocol CategoryListCoordinatorProtocol: AnyObject, Coordinator { }

extension CategoryListCoordinatorProtocol {
    func showCategoryDetailsList(id: Int, title: String, sharedViewModel: SharedViewModel) {
        let viewModel = CategoryDetailsViewModel(title: title, categoryID: id, sharedViewModel: sharedViewModel)
        let view = CategoryDetailsListView(coordinator: self, viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.navigationItem.hidesBackButton = true
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
    func showEventSaved(price: String) {
        let view = EventSavedView(price: price)
        let viewController = UIHostingController(rootView: view)
        viewController.navigationItem.hidesBackButton = true
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
