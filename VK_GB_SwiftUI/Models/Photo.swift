//
//  Photo.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 26.10.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try? newJSONDecoder().decode(Photo.self, from: jsonData)

import Foundation

// MARK: - Photo
struct FullResponsePhoto: Codable {
    let response: ResponsePhoto
}

// MARK: - Response
struct ResponsePhoto: Codable {
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable, Identifiable {
    let id: Int
    let sizes: [SizePhoto]
    let ownerID: Int?
    let likes: Likes?
    private static let optimalSizes = ["x", "y", "z", "w"]
    
    
    func findURLPhotoIfNeeded(by sizeType: String) -> URL? {
        guard let sizeType: PhotoSizeType = PhotoSizeType.init(rawValue: sizeType) else { return nil }
        guard let sizePhoto = self.sizes.first(where: { $0.type == sizeType }) else { return nil }
        return sizePhoto.url
    }
    
    func findOptimalSize() -> URL? {
        for size in Self.optimalSizes {
            if let url = self.findURLPhotoIfNeeded(by: size) { return url }
        }
        return nil
    }
    
}

// MARK: - Likes
struct Likes: Codable {
    let userLikes, count: Int
}

// MARK: - Size
struct SizePhoto: Codable {
    let width, height: Int
    let url: URL?
    let type: PhotoSizeType
}

enum PhotoSizeType: String, Codable {
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}
