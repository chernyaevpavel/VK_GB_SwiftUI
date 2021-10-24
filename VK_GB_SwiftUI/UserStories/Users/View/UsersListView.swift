//
//  UsersListView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI
import Combine

struct UsersListView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {        
        List(self.viewModel.users) { user in
            NavigationLink(
                destination: UserGalleryView(user: user),
                label: {
                    UserCellView(user: user)
                })
        }.onAppear{
            viewModel.getUsers()
        }
        
    }
}

