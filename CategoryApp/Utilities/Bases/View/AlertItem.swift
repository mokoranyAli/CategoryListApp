//
//  AlertItem.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

/// Used to display alert in SwiftUI view
///
struct AlertItem {
    let title: String?
    let message: String?
    
    init(
        title: String? = nil,
        message: String?
    ) {
        self.title = title
        self.message = message
    }
}
