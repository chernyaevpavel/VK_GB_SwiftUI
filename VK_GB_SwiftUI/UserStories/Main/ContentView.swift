//
//  ContentView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginComplete = false
    
    //test @CodingStyle
//    init() {
//        @CodingStyle(style: .camelCase) var myString = "test Test  test QWECSDED"
//        print(myString)
//
//        @CodingStyle(style: .snakeCase) var myString1 = "test Test-  test QWECSDED"
//        print(myString1)
//
//        @CodingStyle(style: .kebabCase) var myString2 = "test Test_  test QWECSDED"
//        print(myString2)
//
//        @CodingStyle(style: .camelCase) var myString3 = " "
//        print(myString3)
//    }
    
    var body: some View {
        NavigationView {
            HStack {
                
                LoginWebView(isLoginComplete: $isLoginComplete)

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
