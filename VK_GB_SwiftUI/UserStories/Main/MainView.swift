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
    let apiService = APIService()
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            let userViewModel = UserViewModel(apiService: apiService)
            UsersListView(viewModel: userViewModel)
                .tabItem { Label("Друзья", systemImage: "person.2.fill") }
                .tag(Tabs.friends)
            
            let groupViewModel = GroupViewModel(apiService: apiService)
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
