//
//  EventSavedView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct EventSavedView: View {
    let price: String
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                
                VStack(spacing: 18) {
                    Text("Event Saved!")
                    .font(
                        Font.appFont(size: 18, weight: .black))
                    .multilineTextAlignment(.center)
                    
                    Text(price)
                    .font(
                        Font.appFont(size: 37, weight: .black))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    
                    Image("stareFill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }.padding(50)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .navigationBarBackButtonHidden(true)
    }
}
