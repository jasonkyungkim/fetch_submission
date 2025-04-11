//
//  RecipeCard.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/9/25.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeModel
    let namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .leading) {
            if let smallURL = recipe.photo_url_small,
               let url = URL(string: smallURL) {
                AsyncImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .matchedTransitionSource(id: recipe.id, in: namespace)
            }

            Text(recipe.name).font(.headline)
            Text(recipe.cuisine).font(.subheadline).foregroundColor(.secondary)
        }
    }
}
