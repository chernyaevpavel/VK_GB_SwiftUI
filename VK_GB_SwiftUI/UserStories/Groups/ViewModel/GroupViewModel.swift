//
//  GroupViewModel.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 12.10.2021.
//

import Foundation
import Combine

class GroupViewModel: ObservableObject {
    let apiService: APIService
    @Published var groups: [Group] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getGroups() {
        apiService.getGroups { groups in
            self.groups = groups
        }
    }
}
