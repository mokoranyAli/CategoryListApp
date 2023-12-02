//
//  AppDelegate.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var coordinator: CategoryListCoordinatorProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupMainWindow()
        return true
    }
    
    private func setupMainWindow() {
        let window = UIWindow()
        window.makeKeyAndVisible()
        self.window = window
        let navigationConroller = UINavigationController()
        self.window?.rootViewController = navigationConroller
        coordinator = CategoryListCoordinator(navigationController: navigationConroller)
        coordinator?.start()
      }
}
