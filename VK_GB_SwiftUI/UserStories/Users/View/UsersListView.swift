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
    let apiService = APIService()
    
    var body: some View {
        List(self.viewModel.users) { user in
            let userGalleryViewModel = UserGalleryViewModel(apiService: apiService, user: user)
            NavigationLink(
                destination: UserGalleryView(viewModel: userGalleryViewModel),
                label: {
                    UserCellView(user: user)
                })
        }.onAppear{
            viewModel.getUsers()
        }
    }
}

