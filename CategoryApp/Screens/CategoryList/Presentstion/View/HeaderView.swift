//
//  HeaderView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    @Binding var price: String
    
    init(title: String = "Event Builder", subtitle: String = "Add to your event to view our cost estimate.",  price: Binding<String> = .constant("-")) {
        self.title = title
        self.subtitle = subtitle
        self._price = price
        
    }
    
    var body: some View {
        
        VStack(spacing: 15) {
            Text(title)
                .font(Font.appFont(size: 18, weight: .black))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Text(subtitle)
                .font(Font.appFont(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.middleGray)
                .padding(.horizontal, 40)
            
            Text(price)
                .font(Font.appFont(size: 37, weight: .black))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
        }
    }
}
