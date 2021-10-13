//
//  Session.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 12.10.2021.
//

import Foundation

final class Session {
    static let shared = Session()
    
    private init() {}
    
    var token: String = ""
    var userId: String = ""
}
