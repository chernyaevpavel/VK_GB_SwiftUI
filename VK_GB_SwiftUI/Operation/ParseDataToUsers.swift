//
//  ParseDataToUsers.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 12.10.2021.
//

import Foundation

class ParseDataToUsers: Operation {
    var users: [User] = []
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let friendsResponse = try? jsonDecoder.decode(Friends.self, from: data)
        guard let users = friendsResponse?.response.items else { return }
        self.users = users
    }
}
