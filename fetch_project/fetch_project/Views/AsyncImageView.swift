//
//  AsyncImageView.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/9/25.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL
    @State private var image: UIImage?

    var body: some View {
        Group {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .onAppear {
                        Task {
                            image = try? await AsyncImageLoader.shared.loadImage(from: url)
                        }
                    }
            }
        }
    }
}

