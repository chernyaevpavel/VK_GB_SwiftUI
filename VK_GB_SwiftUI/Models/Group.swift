//
//  Group.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import Foundation

// MARK: - GroupResponse
struct GroupResponse: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
class Group: Codable, Identifiable {
    var id: Int
    var name: String
    var photo200: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case photo200 = "photo_200"
        case name
    }
    
}
//
//
//class Group: Identifiable {
//    let id: Int
//    let name: String
//    let photo: String
//
//    init(id: Int, name: String, photo: String = "") {
//        self.id = id
//        self.name = name
//        self.photo = photo
//    }
//}
