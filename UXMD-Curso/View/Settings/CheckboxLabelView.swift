////
////  CheckboxLabelView.swift
////  UXMD-Curso
////
////  Created by Murilo Teixeira on 31/08/24.
////
//
//import SwiftUI
//import Lottie
//
//struct CheckboxLabelView: View {
//    
//    @Binding var title: String
//    @State var previousState: CheckboxState = .unchecked
//    @State var state: CheckboxState
//    @State var playbackMode: LottiePlaybackMode = .paused
//    @State var currentFrame: AnimationFrameTime?
//    var onStateChangeCompletion: ((CheckboxState) -> Void)?
//
//    var body: some View {
//        Button {
//            previousState = state
//            state = state == .checked ? .unchecked : .checked
//            onStateChangeCompletion?(state)
//            var fromFrame: CGFloat = 0
//            var toFrame: CGFloat = 0
//            
//            switch (previousState, state) {
//            case (.unchecked, .checked):
//                (fromFrame, toFrame) = (0, 29)
//            case (.checked, .indeterminated):
//                (fromFrame, toFrame) = (60, 89)
//            case (.indeterminated, .checked):
//                (fromFrame, toFrame) = (90, 119)
//            case (.unchecked, .indeterminated):
//                (fromFrame, toFrame) = (120, 149)
//            case (.indeterminated, .unchecked):
//                (fromFrame, toFrame) = (150, 180)
//            default:
//                (fromFrame, toFrame) = (30, 59)
//            }
//
//            #if ENABLE_ANIMATIONS
//            playbackMode = .playing(.fromFrame(fromFrame, toFrame: toFrame, loopMode: .playOnce))
//            #else
//            currentFrame = toFrame
//            #endif
//        } label: {
//            HStack {
//                LottieView(animation: .named("checkbox"))
//                    #if ENABLE_ANIMATIONS
//                    .playbackMode(playbackMode)
//                    .animationDidFinish { _ in
//                        playbackMode = .paused
//                    }
//                    #else
//                    .currentFrame(currentFrame)
//                    #endif
//
//                Text(title)
//            }
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//    
//    mutating func onStateChange(completion: @escaping (CheckboxState) -> Void) -> some View {
//        self.onStateChangeCompletion = completion
//        return self
//    }
//}
//
//#Preview {
//    @State var title = "Title"
//    @State var state: CheckboxState = .unchecked
//    return CheckboxLabelView(title: $title, state: state)
//}
