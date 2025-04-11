//
//  RecipeDetail.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/9/25.
//

import SwiftUI

struct RecipeDetail: View {
    let recipe: RecipeModel
    let namespace: Namespace.ID

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let largeURL = recipe.photo_url_large,
                   let url = URL(string: largeURL) {
                    AsyncImageView(url: url)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .navigationTransition(.zoom(sourceID: recipe.id, in: namespace))
                }

                Text(recipe.name).font(.title).padding(.top)
                Text("Cuisine: \(recipe.cuisine)").font(.subheadline).foregroundColor(.secondary)

                if let source = recipe.source_url {
                    Link("Source", destination: URL(string: source)!)
                        .padding(.top)
                }
                if let youtube = recipe.youtube_url {
                    Link("Watch on YouTube", destination: URL(string: youtube)!)
                }
            }
            .padding()
        }
    }
}
