//
//  BaseViewModel.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import Combine

class BaseViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var alertItem: AlertItem?
    @Published var state: ViewModelState = .idle
}
