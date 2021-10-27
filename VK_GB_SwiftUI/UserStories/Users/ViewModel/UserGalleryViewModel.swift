//
//  UserGalleryViewModel.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 25.10.2021.
//

import Foundation
import SwiftUI

class UserGalleryViewModel: ObservableObject {
    private let apiService: APIService
    private let user: User
    @Published var photos: [Photo] = []
    
    init(apiService: APIService, user: User) {
        self.apiService = apiService
        self.user = user
    }
    
    func getPhotos() {
        if self.photos.isEmpty {
            self.apiService.getPhotos(ownerID: String(self.user.id)) { photos in
                self.photos = photos
            }
        }
    }
}
