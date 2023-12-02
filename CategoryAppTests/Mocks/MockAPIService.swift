//
//  MockAPIService.swift
//  CategoryAppTests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

@testable import CategoryApp
import Combine
import Foundation

class MockAPIService: APIServiceContract {
    
    let fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func request<T>(_ url: URL) async -> Result<T, Error> where T : Decodable {
        guard let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json") else {
            return .failure(NetworkError.invalidURL)
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(T.self, from: data)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
