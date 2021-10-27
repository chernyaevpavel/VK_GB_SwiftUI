//
//  ContentView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginComplete = false
    
    var body: some View {
        NavigationView {
            HStack {
                
                LoginWebView(isLoginComplete: $isLoginComplete)
                
                NavigationLink(
                    destination: MainUIKit()
                        .navigationBarBackButtonHidden(true),
                    isActive: self.$isLoginComplete,
                    label: {
                        EmptyView()
                    })
                
            }
            .navigationBarHidden(true)
        }
    }
}
