//
//  UserViewModel.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 12.10.2021.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    let apiService: APIService
    @Published var users: [User] = []
    
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getUsers() {
        apiService.getFriends { users in
            DispatchQueue.main.async {
                self.users = users
            }
        }
    }
}
