//
//  SettingsView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import SwiftUI
import Lottie

struct NotificationItem: Identifiable {
    
    let id = UUID()
    var title: String
    var isEnabled = false
}

struct Notifications {
    
    let id = UUID()
    var title: String
    var items: [NotificationItem]
    
    var checkboxState: CheckboxState {
        switch items.filter({ $0.isEnabled }).count {
        case 0:
            return .unchecked
        case items.count:
            return .checked
        default:
            return .indeterminated
        }
    }
}

enum CheckboxState: CaseIterable {
    case checked, unchecked, indeterminated
}
    
struct SettingsView: View {
    
    @State var notifications: [NotificationItem] = [
        .init(title: "Message notifications"),
        .init(title: "Private chats"),
        .init(title: "Group chats"),
        .init(title: "Do not disturb"),
    ]

    @State var previousState: CheckboxState = .unchecked
    @State var state: CheckboxState = .unchecked
    @State var playbackMode: LottiePlaybackMode = .paused

    var body: some View {
        List {

            
            ForEach(notifications, id: \.id) { item in
                Button {
                    var newState = CheckboxState.allCases.randomElement() ?? .unchecked
                    
                    while newState == state {
                        newState = CheckboxState.allCases.randomElement() ?? .unchecked
                    }
                    
                    previousState = state
                    state = newState
                    print(previousState, ">", state)
                    







                    // MARK: - STEP 2: Frames definition

                    var frame: (from: CGFloat, to: CGFloat) = (0, 0)
                    



                    switch (previousState, state) {

                    case (.checked, .unchecked):
                        frame = (from: 30, to: 59)

                    

                    case (.unchecked, .checked):
                        frame = (from: 0, to: 29)
                    
                    

                    case (.checked, .indeterminated):
                        frame = (from: 60, to: 89)
                    
                    

                    case (.indeterminated, .checked):
                        frame = (from: 90, to: 118)
                    
                    

                    case (.unchecked, .indeterminated):
                        frame = (from: 120, to: 148)
                    
                    

                    case (.indeterminated, .unchecked):
                        frame = (from: 150, to: 180)
                    


                    default:
                        break
                    }
















                    // MARK: STEP 1: Lottie animation play


                    // MARK: - Lottie with animations
                    // playbackMode = .playing(.fromFrame(frame.from, toFrame: frame.to, loopMode: .playOnce))





                    // MARK: - Lottie without animations
                    playbackMode = .paused(at: .frame(frame.to))





                    















                } label: {
                    HStack {
                        LottieView(animation: .named("checkbox"))
                            .playbackMode(playbackMode)
                            .animationDidFinish { _ in
                                playbackMode = .paused
                            }
                        
                        Text(item.title)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    @ViewBuilder
    func checkbox(
        item: NotificationItem,
        previousState: inout CheckboxState?,
        state: inout CheckboxState?,
        playbackMode: inout LottiePlaybackMode?
    ) -> some View {
        
    }
}

#Preview {
    SettingsView()
}
