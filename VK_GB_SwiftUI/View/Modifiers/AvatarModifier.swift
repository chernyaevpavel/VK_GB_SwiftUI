//
//  AvatarModifier.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI

struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 50, maxHeight: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(color: .black, radius: 5, x: 3, y: 0)
            
    }
}

extension View {
    func avatarModifier() -> some View {
        self.modifier(AvatarModifier())
    }
}
