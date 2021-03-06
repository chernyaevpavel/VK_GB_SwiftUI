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
                
                LoginView(isLoginComplete: $isLoginComplete)
                
                NavigationLink(
                    destination: MainView(),
                    isActive: self.$isLoginComplete,
                    label: {
                        EmptyView()
                    })
                    
            }
            .navigationBarHidden(true)   
        }
    }
}
