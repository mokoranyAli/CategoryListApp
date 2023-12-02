//
//  APIService.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//


import Combine
import Foundation

protocol APIServiceContract {
    func request<T: Decodable>(_ url: URL) async -> Result<T, Error>
}

class APIService: APIServiceContract {
    
    static let shared: APIService = .init()
    
    func request<T: Decodable>(_ url: URL) async -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard response is HTTPURLResponse else {
                return .failure(NetworkError.invalidResponse)
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return .success(result)
            } catch {
                print(error)
                return .failure(NetworkError.decoding(error))
            }
        } catch {
            return .failure(NetworkError.invalidResponse)
        }
    }
}
