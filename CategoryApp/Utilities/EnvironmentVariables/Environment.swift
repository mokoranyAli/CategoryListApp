//
//  Environment.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Foundation

public struct Environment {
    enum Keys {
        static let baseURL = "BASE_URL"
    }
    
    // Get the BASE_URL
    static let baseURL: String = {
        guard let baseURLProperty = Bundle.main.object(
            forInfoDictionaryKey: Keys.baseURL
        ) as? String else {
            fatalError("BASE_URL not found")
        }
        return baseURLProperty
    }()
}
