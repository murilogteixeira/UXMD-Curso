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
    @State var fabIsExpanded = false
    @State var editMode: EditMode = .inactive
    @State var snackbarIsEnabled = false
    @State var snackbarShouldAppear = false
    @State var snackbarScaled = false
    @State var scale: CGFloat = 0

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
            .safeAreaInset(edge: .bottom) {
                Spacer()
                    .frame(height: 100)
            }

            VStack {
                Spacer()

                if snackbarShouldAppear {
                    HStack {
                        Text("Item deletado")
                            .foregroundStyle(.white)
                            .padding(24)

                        Spacer()
                    }
                    .background {
                        Rectangle()
                            .fill(Colors.surface.color)
                            .cornerRadius(4)
                            .opacity(snackbarIsEnabled ? 1 : 0)
                            // MARK: - With animations
                            //*
                            .animation(.linear(duration: 0.150), value: snackbarIsEnabled)
                            // */
                            .scaleEffect(CGSize(width: 1, height: snackbarScaled ? scale : 0), anchor: .bottom)
                            // MARK: - With animations
                            //*
                            .animation(.timingCurve(0.2, 0, 0, 1, duration: 0.300), value: scale)
                            // */
                    }
                    .onAppear {
                        // MARK: - With animations
                        //*
                        withAnimation {
                        scale = 1
                        snackbarIsEnabled = true
                        snackbarScaled = true
                        }
                        // */

                        // MARK: - With animations
                        /*
                        snackbarIsEnabled = true
                        snackbarScaled = true
                        // */
                    }

                }

                Spacer()
                    .frame(height: 16)

                HStack {
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Image(systemName: "pencil")
                            .frame(width: 24, height: 24)
                            .fontWeight(.black)
                            // MARK: - With animations
                            //*
                            .animation(.timingCurve(0.4, 0, 0.2, 1, duration: 0.300), value: fabIsExpanded)
                            // */

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
                    // MARK: - With animations
                    //*
                    .animation(
                        .timingCurve(0.4, 0, 0.2, 1, duration: 0.300),
                        value: fabIsExpanded
                    )
                    // */
                    .onTapGesture {
                        // MARK: - With animations
                        //*
                        withAnimation {
                            fabIsExpanded.toggle()
                            editMode = fabIsExpanded ? .active : .inactive
                        }
                        // */

                        // MARK: - With animations
                        /*
                        fabIsExpanded.toggle()
                        editMode = fabIsExpanded ? .active : .inactive
                        // */
                    }
                }
            }
            .padding(24)
        }
    }
    
    private func deleteItems(at offset: IndexSet) {
        chat.remove(atOffsets: offset)

        snackbarShouldAppear = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            // MARK: - With animations
            /*
            withAnimation {
                snackbarIsEnabled = false
            } completion: {
                snackbarShouldAppear = false
                snackbarScaled = false
                scale = 0
            }
            // */

            // MARK: - Without animations
            //*
            snackbarIsEnabled = false
            snackbarShouldAppear = false
            snackbarScaled = false
            scale = 0
            // */
        }
    }
}

#Preview {
    @State var chat: Chat = .mock
    return ChatView(chat: chat)
}

