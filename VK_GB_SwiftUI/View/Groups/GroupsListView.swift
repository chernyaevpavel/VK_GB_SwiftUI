//
//  GroupsListView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct GroupsListView: View {
    @State var groups: [Group] = []
    
    var body: some View {
        
        List(self.groups) { group in
            GroupCellView(group: group)
        }.onAppear{
            self.groups = self.fillGroups()
        }
    }
    
    private func fillGroups() -> [Group] {
        var groupsLockal: [Group] = []
        for i in 0...100 {
            let group = Group(id: i, name: "\(i) Авто мото вело фото", photo: "groupAvatar")
            groupsLockal.append(group)
        }
        return groupsLockal
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}
