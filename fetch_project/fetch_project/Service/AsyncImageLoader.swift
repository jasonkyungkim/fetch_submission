//
//  AsyncImageLoader.swift
//  fetch_project
//
//  Created by Chongkyung Kim on 4/8/25.
//
import UIKit

actor AsyncImageLoader{
    static let shared = AsyncImageLoader()
    private let cache = URLCache.shared
    
    func loadImage(from url: URL) async throws -> UIImage? {
        let request = URLRequest(url: url)
        
        if let cachedRespone = cache.cachedResponse(for: request),
           let image = UIImage(data: cachedRespone.data) {
            return image
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return nil
        }
        
        let cachedData = CachedURLResponse(response: response, data: data)
        cache.storeCachedResponse(cachedData, for: request)
        return UIImage(data: data)
    }
}

