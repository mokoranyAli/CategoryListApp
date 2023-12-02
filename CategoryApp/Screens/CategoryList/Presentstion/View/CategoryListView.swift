//
//  CategoryListView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

struct CategoryListView: View {
    
    @StateObject var viewModel: CategoryListViewModel 
    var coordinator: CategoryListCoordinatorProtocol
    private let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible()),
    ]
    
    init(coordinator: CategoryListCoordinatorProtocol) {
        self.coordinator = coordinator
        
#if DEBUG
        if UITestingHelper.isUITesting {
            let viewModel = CategoryListViewModel(loadCategoriesUseCase: LoadCategoriesUseCase(repository: CategoryListRepository(service: CategoryListService(apiService: MockAPIService(fileName: UITestingHelper.categoryListJson)))))
            self._viewModel = StateObject(wrappedValue: viewModel)
        }
        else {
            self._viewModel = StateObject(wrappedValue: .init())
        }
#else
        self._viewModel = StateObject(wrappedValue: .init())
#endif
    }
    var body: some View {
        BaseView(state: $viewModel.state, alertItem: $viewModel.alertItem) {
            GeometryReader { geometryReader in
                ScrollView {
                    VStack {
                        HeaderView(price: .constant(viewModel.sharedViewmodel.priceAsString))
                        gridView
                        Spacer()
                        eventSavedButton
                    }
                    .frame(minHeight: geometryReader.size.height - 60)
                }.padding(.vertical)
                    .padding(.horizontal, 16)
            }
        }
    }
    
    private var gridView: some View {
        LazyVGrid(columns: columns, spacing: 18) {
            ForEach(viewModel.categories, id: \.self) { item in
                Button {
                    if let id = item.id, let title = item.title {
                        coordinator.showCategoryDetailsList(id: id, title: title, sharedViewModel: viewModel.sharedViewmodel)
                    }
                } label: {
                    CategoryListRowView(item: item, selectedCategoryCount: .constant(viewModel.sharedViewmodel.selectedCategories[item.id ?? .zero ]))
                }.foregroundColor(.black)
            }
        }
    }
    
    private var eventSavedButton: some View {
        Button {
            
            if viewModel.sharedViewmodel.price > .zero {
                coordinator.showEventSaved(price: viewModel.sharedViewmodel.priceAsString)
            }
           
        } label: {
            Text("Save")
        } .frame(maxWidth: .infinity)
            .padding()
            .background(Color.primary)
            .cornerRadius(4)
            .foregroundColor(.white)
    }
}
