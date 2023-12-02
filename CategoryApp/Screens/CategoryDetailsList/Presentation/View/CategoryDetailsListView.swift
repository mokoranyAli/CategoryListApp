//
//  CategoryDetailsListView.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import SwiftUI

import SwiftUI

struct CategoryDetailsListView: View {
    @SwiftUI.Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: CategoryDetailsViewModel
    var coordinator: CategoryListCoordinatorProtocol
    let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible()),
    ]
    init(coordinator: CategoryListCoordinatorProtocol, viewModel: CategoryDetailsViewModel) {
        self.coordinator = coordinator
        
#if DEBUG
        if UITestingHelper.isUITesting {
            let uiTestingViewModel = CategoryDetailsViewModel(title: "", categoryID: .zero, sharedViewModel: viewModel.sharedViewmodel, loadCategoryDetailssUseCase: LoadCategoryDetailsUseCase(repository: CategoryDetailsListRepository(service: CategoryDetailsListService(apiService: MockAPIService(fileName: UITestingHelper.categoryDetailsListJson)))))
            self._viewModel = StateObject(wrappedValue: uiTestingViewModel)
        }
        else {
            self._viewModel =  StateObject(wrappedValue: viewModel)
        }
#else
        self._viewModel = StateObject(wrappedValue: viewModel)
#endif
    }
    var body: some View {
        BaseView(state: $viewModel.state, alertItem: $viewModel.alertItem) {
            ScrollView {
                HeaderView(title: viewModel.title, price: .constant(viewModel.displayedPrice))
                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(viewModel.categoryItems, id: \.self) { item in
                        DetailsItemRowView(item: item, selectedItems: $viewModel.sharedViewmodel.selectedItems)
                            .onTapGesture {
                                
                            }
                    }
                }
            }.padding(.vertical)
                .padding(.horizontal, 16)
                .navigationBarItems(leading: backButton)
                .navigationBarBackButtonHidden(true)
        }
    }
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("BackBtn") // set image here
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
}
