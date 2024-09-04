//
//  LottieView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 03/09/24.
//

import SwiftUI
import Lottie

struct CustomLottieView: View {

    let lottieName: String
    @State var playbackMode: LottiePlaybackMode = .paused
    @State var loopMode: LottieLoopMode = .loop
    @State var buttonIndex = 0
    @State var playButtonIndex = 2
    @State var fromProgress = ""
    @State var toProgress = ""

    var body: some View {
        VStack(spacing: 24) {
            LottieView(animation: .named(lottieName))
                .playbackMode(playbackMode)
                .animationDidFinish { _ in
                    playbackMode = .paused
                    playButtonIndex = -1
                }

            Spacer()

            HStack {
                createPlaybackModeButton(
                    "play",
                    mode: .playing(
                        .fromProgress(
                            .init(Float(fromProgress) ?? 0),
                            toProgress: .init(Float(toProgress) ?? 1),
                            loopMode: loopMode
                        )
                    ),
                    index: 0
                )
                
                createPlaybackModeButton("pause", mode: .paused, index: 1)
                createPlaybackModeButton("stop", mode: .paused(at: .progress(0)), index: 2)
            }

            HStack {
                createLoopModeButton("Loop", mode: .loop, index: 0)
                createLoopModeButton("Auto reverse", mode: .autoReverse, index: 1)
                createLoopModeButton("Play once", mode: .playOnce, index: 2)
                createLoopModeButton("Repeat 3", mode: .repeat(3), index: 3)
            }

            HStack {
                createTextInput(titleKey: "From progress (0.0)", text: $fromProgress)
                createTextInput(titleKey: "To progress (1.0)", text: $toProgress)
            }
        }
        .padding()
    }

    @ViewBuilder
    func createPlaybackModeButton(_ imageName: String, mode: LottiePlaybackMode, index: Int) -> some View {
        Button {
            self.playbackMode = mode
            playButtonIndex = index
        } label: {
            Image(systemName: imageName)
        }
        .buttonStyle(BorderedButtonStyle())
        .foregroundStyle(playButtonIndex == index ? .white : .black)
        .background(playButtonIndex == index ? .blue : .gray.opacity(0.05))
        .cornerRadius(8)
    }

    @ViewBuilder
    func createLoopModeButton(_ title: String, mode: LottieLoopMode, index: Int) -> some View {
        Button {
            self.loopMode = mode
            buttonIndex = index
        } label: {
            Text(title)
        }
        .buttonStyle(BorderedButtonStyle())
        .foregroundStyle(buttonIndex == index ? .white : .black)
        .background(buttonIndex == index ? .blue : .gray.opacity(0.05))
        .cornerRadius(8)
    }

    @ViewBuilder
    func createTextInput(titleKey: String, text: Binding<String>) -> some View {
        TextField(titleKey, text: text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#Preview {
    CustomLottieView(lottieName: "Lottie1")
}
