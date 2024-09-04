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











                    // MARK: - STEP 3: Snackbar
                    /*
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



                            // MARK: - Opacity animation
                            // .animation(.linear(duration: 0.150), value: snackbarIsEnabled)




                            .scaleEffect(CGSize(width: 1, height: snackbarScaled ? scale : 0), anchor: .bottom)





                            // MARK: - Scale animations
                            // .animation(.timingCurve(0.2, 0, 0, 1, duration: 0.300), value: scale)
                    }









                    .onAppear {

                        // MARK: - With animations
                        // withAnimation {
                        // scale = 1
                        // snackbarIsEnabled = true
                        // snackbarScaled = true
                        // }






                        // MARK: - Without animations
                        snackbarIsEnabled = true
                        snackbarScaled = true
                    }
                     // */















                }

                Spacer()
                    .frame(height: 16)

                HStack {
                    Spacer()




                    // MARK: STEP 1: Edit Button (FAB)
                    HStack(spacing: 12) {












                        Image(systemName: "pencil")
                            .frame(width: 24, height: 24)
                            .fontWeight(.black)












                        // Text visibility condition

                        if fabIsExpanded {



                            Text("Editar")
                                .font(.system(size: 14, weight: .medium))


                                // MARK: - Text opacity animation
                                // .animation(.linear(duration: fabIsExpanded ? 0.150 : 0.100), value: fabIsExpanded)



                        }













                    }
                    .padding(16)
                    .background(Colors.primary.color)
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    .shadow(radius: 10, y: 8)
                    .shadow(radius: 4, y: 1)









                    // MARK: - Expand and collapse animation
                    // .animation(
                    //     .timingCurve(0.4, 0, 0.2, 1, duration: 0.300),
                    //     value: fabIsExpanded
                    // )











                    .onTapGesture {


                        // MARK: - STEP 2: Enable animations

                        // MARK: - Collapse and expand with motion
                        // withAnimation {
                        //     fabIsExpanded.toggle()
                        //     editMode = fabIsExpanded ? .active : .inactive
                        // }








                        // MARK: - Collapse and expand without motion
                         fabIsExpanded.toggle()
                         editMode = fabIsExpanded ? .active : .inactive




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
            // withAnimation {
            //     snackbarIsEnabled = false
            // } completion: {
            //     snackbarShouldAppear = false
            //     snackbarScaled = false
            //     scale = 0
            // }









            // MARK: - Without animations
            snackbarIsEnabled = false
            snackbarShouldAppear = false
            snackbarScaled = false
            scale = 0






        }
    }
}

#Preview {
    @State var chat: Chat = .mock
    return ChatView(chat: chat)
}

