//
//  StatusColorModifire.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct StatusColorModifire: ViewModifier {
    let status: Status
    
    func body(content: Content) -> some View {
        var color: Color
        
        if status == .onLine {
            color = Color.green
        } else {
            color = Color.red
        }
        return content.foregroundColor(color)
    }
}

extension View {
    func statusColorModifire(status: Status) -> some View {
        self.modifier(StatusColorModifire(status: status))
    }
}
