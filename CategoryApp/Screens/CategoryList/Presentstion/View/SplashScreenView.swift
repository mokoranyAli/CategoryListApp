//
//  SplashScreenView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var coordinator: CategoryListCoordinatorProtocol
    
    var body: some View {
        if isActive {
            CategoryListView(coordinator: coordinator)
        } else {
            VStack {
                VStack {
                    Image("swenson-he-logo")
                        .font(.system(size: 80))
                        
                    Text("Swenson He Test App")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
