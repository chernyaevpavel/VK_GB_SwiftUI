//
//  GroupCellView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI

struct GroupCellView: View {
    @State var name: String = "Авто мото вело фото"
    
    var body: some View {
        HStack {
            Image("groupAvatar")
                .resizable()
                .avatarModifier()
            
            Text("\(name)")
                .font(.body)
            
            Spacer()
        }
        .border(Color.gray)
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView()
    }
}
