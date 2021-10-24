//
//  MainView.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 10.10.2021.
//

import SwiftUI

enum Tabs: String {
    case friends = "Друзья"
    case groups = "Группы"
    case news = "Новости"
}

struct MainView: View {
    @State var selectedTab: Tabs = .friends
    
    let userViewModel: UserViewModel
    let groupViewModel: GroupViewModel
    
    init() {
        let apiService = APIService()
        self.userViewModel = UserViewModel(apiService: apiService)
        self.groupViewModel = GroupViewModel(apiService: apiService)
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            UsersListView(viewModel: userViewModel)
                .tabItem { Label("Друзья", systemImage: "person.2.fill") }
                .tag(Tabs.friends)
            
            
            GroupsListView(viewModel: groupViewModel)
                .tabItem { Label("Группы", systemImage: "person.3.fill") }
                .tag(Tabs.groups)
            
            NewsListView()
                .tabItem { Label("Новости", systemImage: "newspaper.fill") }
                .tag(Tabs.news)
        }
        .navigationTitle(selectedTab.rawValue)
        .navigationBarBackButtonHidden(true)
    }
}
