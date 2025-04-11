//
//  RecipeListView.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/8/25.
//

import SwiftUI

// Error wrapper so it can conform to Identifiable
struct ErrorWrapper: Identifiable {
    let id = UUID()
    let message: String
}


struct RecipeListView: View {
    @State private var viewModel = RecipeListViewModel()
    @Namespace private var namespace

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(value: recipe) {
                            RecipeCard(recipe: recipe, namespace: namespace)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: RecipeModel.self) { recipe in
                RecipeDetail(recipe: recipe, namespace: namespace)
            }
            .task {
                await viewModel.loadRecipes()
            }
            .alert(item: $viewModel.errorWrapper) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}
