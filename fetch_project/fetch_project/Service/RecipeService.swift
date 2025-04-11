//
//  RecipeService.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/8/25.
//

import Foundation
import SwiftUI


@Observable class RecipeListViewModel {
    var recipes: [RecipeModel] = []
    var errorWrapper: ErrorWrapper?

    private let service: RecipeService

    init(service: RecipeService = RecipeService()) {
        self.service = service
    }

    func loadRecipes() async {
        do {
            self.recipes = try await service.fetchRecipes()
        } catch {
            self.errorWrapper = ErrorWrapper(message: "Failed to load recipes: \(error.localizedDescription)")
        }
    }
}

struct RecipeService {
    func fetchRecipes() async throws -> [RecipeModel] {
        // Simulate network latency
        try await Task.sleep(nanoseconds: 500_000_000)

        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return decoded.recipes
    }
}

//    private func loadRecipes() async {
////        do {
////            guard let url = URL(string: "https://actual_endpoint.com/recipes") else { return }
////            self.recipes = try await RecipeService.shared.fetchRecipes(from: url)
////        } catch {
////            self.errorWrapper = ErrorWrapper(message: "Failed to load recipes: \(error.localizedDescription)")
////        }
//        do {
//                self.recipes = try await RecipeService.shared.fetchDemoRecipes()
//            } catch {
//                self.errorWrapper = ErrorWrapper(message: "Failed to load recipes: \(error.localizedDescription)")
//            }
//    }
