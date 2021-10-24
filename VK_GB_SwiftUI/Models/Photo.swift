//
//  Photo.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 11.10.2021.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
