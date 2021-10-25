//
//  MainUIKit.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 24.10.2021.
//

import Foundation
import SwiftUI

struct MainUIKit: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainCoordinator {
        MainCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: MainCoordinator, context: Context) { }
}

