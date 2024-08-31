//
//  ContactsView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import SwiftUI

struct ContactsView: View {
    
    @Binding var chat: Chat
    
    var body: some View {
        List($chat, id: \.self) { chatElement in
            HStack(spacing: 16) {
                AsyncImage(url: chatElement.imageUrl.wrappedValue) { image in
                    image.image?.resizable()
                }
                .clipShape(Circle())
                .frame(width: 56, height: 56)
                
                Text(chatElement.name.wrappedValue)
                    .font(.system(size: 16))
                    .foregroundStyle(Colors.textHigh.color)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    @State var chat: Chat = .mock
    return ContactsView(chat: $chat)
}
