//
//  TabBarView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State var chat = Chat.mock

    var body: some View {
        TabView {
            ChatView(chat: chat)
                .tabItem { Label("Chats", systemImage: "house") }
            
            ContactsView(chat: $chat)
                .tabItem { Label("Contacts", systemImage: "person.3") }
            
            NavigationView {
                SettingsView()
                    .navigationTitle("Notification")
            }
            .tabItem { Label("Settings", systemImage: "gear") }
        }
        .tint(Colors.highlight.color)
    }
}

#Preview {
    TabBarView()
}
