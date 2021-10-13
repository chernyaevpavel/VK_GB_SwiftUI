//
//  GroupsListView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

struct GroupsListView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(self.viewModel.groups) { group in
            GroupCellView(group: group)
        }
        .onAppear{
            viewModel.getGroups()
        }
    }
}
