//
//  GroupCellView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI
import Kingfisher

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            KFImage(self.group.photo200)
                .cancelOnDisappear(true)
                .resizable()
                .avatarModifier()
                .avatarTapAnimationModifier()
            
            Text("\(self.group.name)")
                .font(.body)
            
            Spacer()
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))
    }
}
