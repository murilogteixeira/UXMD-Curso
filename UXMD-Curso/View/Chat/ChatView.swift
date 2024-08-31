//
//  ChatView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import SwiftUI

struct ChatView: View {
    
    @Binding var chat: Chat
    
    var body: some View {
        List($chat, id: \.self) { chatElement in
            ChatCell(chat: chatElement)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    @State var chat: Chat = .mock
    return ChatView(chat: $chat)
}

