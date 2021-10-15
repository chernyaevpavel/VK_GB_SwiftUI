//
//  UserCellView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            KFImage(self.user.photo200Orig)
                .cancelOnDisappear(true)
                .resizable()
                .avatarModifier()
                .avatarTapAnimationModifier()
            
            VStack(alignment: .leading) {
                Text("\(self.user.firstName) \(self.user.lastName)")
                    .font(.body)
            
                Text("\(self.user.status.rawValue)")
                    .font(.subheadline)
                    .statusColorModifire(status: self.user.status)
            }
            
            Spacer()
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))
    }
}
