//
//  UserGalleryView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 11.10.2021.
//

import SwiftUI
import ASCollectionView

struct UserGalleryView: View {
    
    let user: User
    
    var body: some View {
        ASCollectionView(data: self.user.photos) { photo, context in
            Text("\(photo.name)")
                .background(Color.red)
        }
        .layout {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(50))
        }
    }
}

struct UserGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        UserGalleryView(user: User(id: 0, firstName: "Alex", lastName: "Petrov"))
    }
}
