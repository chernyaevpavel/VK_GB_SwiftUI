//
//  Group.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import Foundation

class Group: Identifiable {
    let id: Int
    let name: String
    let photo: String
    
    init(id: Int, name: String, photo: String = "") {
        self.id = id
        self.name = name
        self.photo = photo
    }
}
