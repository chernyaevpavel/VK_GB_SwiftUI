//
//  User.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import Foundation

// MARK: - Friends
struct Friends: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [User]
}

// MARK: - Item
struct User: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    //    var photo200Orig: String?
    var photo200Orig: URL
    var online: Int
    
    var status: Status {
        return online == 1 ? Status.onLine : Status.offLine
    }
}


