//
//  CategoryListRowView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct CategoryListRowView: View {
    let item: CategoryResponse
    @Binding var selectedCategoryCount: Int?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                image
                    .frame(maxWidth: .infinity, maxHeight: 104)
                    .cornerRadius(4)
                
                HStack {
                    Text(item.title ?? "")
                        .font(Font.appFont(size: 14, weight: .medium))
                        .foregroundColor(Color.darkGray)
                    Spacer()
                    Image("arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                }
                .padding()
            }.background(Color.white)
                .padding(2)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 1)
                
            if let selectedCategoryCount, shouldShowAsSelected  {
                Circle()
                    .fill(Color.primary)
                .frame(width: 30, height: 30, alignment: .center)
                .overlay(
                    Text("\(selectedCategoryCount)")
                        .foregroundColor(.white)
                        .font(Font.medium14)
                ).padding()
            }
        }
    }
    
    private var shouldShowAsSelected: Bool {
        selectedCategoryCount ?? .zero > .zero
    }
    private var image: some View {
        AsyncImage(url: .init(string: item.image ?? ""), content: { image in
            image.resizable()
                .scaledToFill()
        }, placeholder: {
            Image("placeholder-image-icon")
                .resizable()
                .scaledToFit()
        })
    }
}
