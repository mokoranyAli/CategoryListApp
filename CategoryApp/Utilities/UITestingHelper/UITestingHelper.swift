//
//  UITestingHelper.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

#if DEBUG
struct UITestingHelper {
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("ui-testing")
    }
    
    static let categoryListJson: String = {
        return "CategoryListUI"
    }()
    
    static let categoryDetailsListJson: String = {
        return "CategoryDetailsListUI"
    }()
}
#endif
