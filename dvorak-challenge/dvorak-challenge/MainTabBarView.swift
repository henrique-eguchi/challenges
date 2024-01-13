//
//  MainTabBarView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    DvoraIcons.home.image
                }
            Text("Chat")
                .tabItem {
                    DvoraIcons.chat.image
                }
            Text("Calendar")
                .tabItem {
                    DvoraIcons.calendar.image
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabBarView()
}
