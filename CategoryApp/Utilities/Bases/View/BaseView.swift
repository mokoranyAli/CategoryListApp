//
//  BaseView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    @Binding private var state: ViewModelState
    @Binding private var alertItem: AlertItem?
    let content: Content
    // MARK: - INIT
    init(
        state: Binding<ViewModelState>,
        alertItem: Binding<AlertItem?>? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self._state = state
        self.content = content()
        self._alertItem = alertItem ?? .constant(nil)
    }
    
    var body: some View {
        ZStack {
            content
            
            if state == .loading {
                ProgressView()
                
            }
        }.alert(isPresented: .constant(alertItem != nil)) {
            Alert(title: Text(alertItem?.title ?? ""), message: Text(alertItem?.message ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}
