//
//  ChatCell.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 29/08/24.
//

import SwiftUI
import Foundation

struct ChatCell: View {
    
    @Binding var chat: ChatElement
    
    let dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: chat.imageUrl) { image in
                image.image?.resizable()
            }
            .clipShape(Circle())
            .frame(width: 56, height: 56)
            
            VStack(alignment: .leading) {
                Text(chat.name)
                    .font(.system(size: 16))
                    .foregroundStyle(Colors.textHigh.color)
                
                Text(chat.message)
                    .font(.system(size: 14, weight: chat.unreadedMessagesCount > 0 ? .medium : .regular))
                    .lineLimit(2)
                    .foregroundStyle(Colors.textMedium.color)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text(dateFormatter.string(from: chat.date).replacingOccurrences(of: ", ", with: "\n"))
                    .font(.system(size: 12))
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(Colors.textMedium.color)
                
                if chat.unreadedMessagesCount > 0 {
                    Circle()
                        .overlay {
                            Text("\(chat.unreadedMessagesCount)")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.white)
                        }
                        .frame(width: 22, height: 22)
                        .foregroundStyle(Colors.highlight.color)
                }
            }
        }
    }
}

#Preview {
    @State var chat = ChatElement(from: .mock)
    return ChatCell(chat: $chat)
}
