//
//  RecipeModel.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/8/25.
//

import Foundation

struct RecipeModel: Identifiable, Codable, Hashable {
    var id: String { uuid }

    let cuisine: String
    let name: String
    let uuid: String

    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let youtube_url: String?
}


struct RecipeResponse: Codable {
    let recipes: [RecipeModel]
}
