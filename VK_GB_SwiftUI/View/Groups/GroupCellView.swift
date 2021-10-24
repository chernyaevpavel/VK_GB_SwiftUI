//
//  GroupCellView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            Image(self.group.photo)
                .resizable()
                .avatarModifier()
            
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

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        let group = Group(id: 0, name: "Авто мото вело фото", photo: "groupAvatar")
        GroupCellView(group: group)
    }
}
