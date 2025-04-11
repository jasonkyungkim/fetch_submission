//
//  fetch_projectTests.swift
//  fetch_projectTests
//
//  Created by Chongkyung Kim on 4/8/25.
//

import XCTest
@testable import fetch_project

final class RecipeAppTests: XCTestCase {

    func testValidJSONDecoding() throws {
        let json = """
        {
            "recipes": [{
                "cuisine": "Italian",
                "name": "Spaghetti",
                "photo_url_large": "https://example.com/large.jpg",
                "photo_url_small": "https://example.com/small.jpg",
                "uuid": "1234",
                "source_url": "https://example.com",
                "youtube_url": "https://youtube.com"
            }]
        }
        """.data(using: .utf8)!

        let result = try JSONDecoder().decode(RecipeResponse.self, from: json)
        XCTAssertEqual(result.recipes.count, 1)
        XCTAssertEqual(result.recipes.first?.name, "Spaghetti")
    }

    func testEmptyResponse() throws {
        let json = """
        {
            "recipes": []
        }
        """.data(using: .utf8)!

        let result = try JSONDecoder().decode(RecipeResponse.self, from: json)
        XCTAssertTrue(result.recipes.isEmpty)
    }

    func testMissingFieldsThrows() {
        let json = """
        {
            "recipes": [{
                "name": "Incomplete Recipe"
            }]
        }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(RecipeResponse.self, from: json))
    }

//    func testImageCaching() async throws {
//        let testURL = URL(string: "https://via.placeholder.com/150")!
//        let image1 = try await AsyncImageLoader.shared.loadImage(from: testURL)
//        XCTAssertNotNil(image1)
//
//        let cachedImage = try await AsyncImageLoader.shared.loadImage(from: testURL)
//        XCTAssertNotNil(cachedImage)
//    }
}
