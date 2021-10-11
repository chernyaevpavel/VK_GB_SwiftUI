//
//  UsersListView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct UsersListView: View {
    @State var users: [User] = []
    
    var body: some View {        
        List(self.users) { user in
            NavigationLink(
                destination: UserGalleryView(user: user),
                label: {
                    UserCellView(user: user)
                })
        }.onAppear{
            self.users = self.fillUsers()
        }
    }
    
    private func fillUsers() -> [User] {
        var usersLockal: [User] = []
        for i in 0...100 {
            var photos: [Photo] = []
            for y in 0...100 {
                photos.append(Photo(name: "\(y)"))
            }
            let user = User(id: i, firstName: "Иванов (\(i))", lastName: "Александр", photo: "dog", status: .offLine, photos: photos)
            usersLockal.append(user)
        }
        return usersLockal
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}


