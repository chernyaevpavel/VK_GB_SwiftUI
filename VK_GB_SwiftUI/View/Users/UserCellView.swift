//
//  UserCellView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 06.10.2021.
//

import SwiftUI

struct UserCellView: View {
    @State var name: String = "Иванов Петр Сидорович"
    @State var status: String = "offLine"
    
    var body: some View {
        HStack {
            Image("dog")
                .resizable()
                .avatarModifier()
            VStack(alignment: .leading) {
                Text("\(name)")
                    .font(.body)
                Text("\(status)")
                    .font(.subheadline)
                    .foregroundColor(Color.red)
            }
            
            Spacer()
        }
        .border(Color.gray)
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}
