//
//  Coordinator.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import UIKit

protocol Coordinator {
    
    /// Root navigation controller of the coordinator.
    var navigationController: UINavigationController { get }
    
    /// Starts job of the coordinator.
    func start()
}
