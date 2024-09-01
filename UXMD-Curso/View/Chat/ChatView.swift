//
//  ChatView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import SwiftUI

struct ChatView: View {
    
    @State var chat: Chat
    @State private var previousOffset: CGFloat = 0
    @State private var scrollDirection: ScrollDirection = .none
    @State var fabIsExpanded = false
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        ZStack {
            List {
                ForEach($chat, id: \.self) { chatElement in
                    ChatCell(chat: chatElement)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
            .environment(\.editMode, $editMode)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Image(systemName: "pencil")
                            .frame(width: 24, height: 24)
                            .fontWeight(.black)
                            .animation(.timingCurve(0.4, 0, 0.2, 1, duration: 0.300), value: fabIsExpanded)
                        
                        if fabIsExpanded {
                            Text("Editar")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    .padding(16)
                    .background(Colors.primary.color)
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    .shadow(radius: 10, y: 8)
                    .shadow(radius: 4, y: 1)
                    .animation(
                        .timingCurve(0.4, 0, 0.2, 1, duration: 0.300),
                        value: fabIsExpanded
                    )
                    .onTapGesture {
                        withAnimation {
                            fabIsExpanded.toggle()
                            editMode = fabIsExpanded ? .active : .inactive
                        }
                    }
                }
            }
            .padding(24)
        }
    }
    
    private func deleteItems(at offset: IndexSet) {
        chat.remove(atOffsets: offset)
    }
}

enum ScrollDirection: String {
    case up = "Up"
    case down = "Down"
    case none = "None"
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    @State var chat: Chat = .mock
    return ChatView(chat: chat)
}

