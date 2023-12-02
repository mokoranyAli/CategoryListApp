//
//  DetailsItemRowView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct DetailsItemRowView: View {
    let item: CategroyDetailResponse
    @Binding var selectedItems: [CategroyDetailResponse]
    
    private var isSelected: Bool {
        selectedItems.contains(item)
    }
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                image
                    .frame(maxWidth: .infinity, maxHeight: 104)
                    .cornerRadius(4)
                VStack(alignment: .leading) {
                    Text(item.title ?? "")
                        .font(Font.appFont(size: 14, weight: .regular))
                    if let minBudget = item.minBudget, let maxBudget = item.maxBudget {
                        Text("$\(minBudget) - \(maxBudget)")
                            .font(Font.appFont(size: 14, weight: .black))
                    }
                }.padding()
                    
            }.background(Color.white)
                .padding(2)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 1)
            
            Button {
                selectedItems = isSelected ? selectedItems.filter { $0 != item} : selectedItems + [item]
            } label: {
                
                additionIcon
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
            }.padding()
        }
    }
    
    private var additionIcon: Image {
        if isSelected {
            return Image("itemIsAdded")
        }
        else {
            return Image("AddItem")
        }
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
