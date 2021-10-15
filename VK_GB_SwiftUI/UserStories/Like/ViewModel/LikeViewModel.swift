//
//  LikeViewModel.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 15.10.2021.
//

import Foundation

class LikeViewModel: ObservableObject {
    @Published var countLike: Int
    @Published var isLiked: Bool
    
    init(countLike: Int, isLiked: Bool = false) {
        self.countLike = countLike
        self.isLiked = isLiked
    }
    
    func toggleLike() {
        let cnt = isLiked ? -1 : 1
        countLike += cnt
        isLiked.toggle()
    }
}
