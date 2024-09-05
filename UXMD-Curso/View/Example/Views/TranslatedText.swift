//
//  TranslatedText.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 05/09/24.
//

import SwiftUI

struct TranslatedText: View {

    @State var isScaling = false
    let xOffset: CGFloat = 80
    let duration: TimeInterval = 1.5

    var body: some View {
        VStack(spacing: 32) {
            buildText("easeIn")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(.easeIn(duration: duration), value: isScaling)

            buildText("easeOut")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(.easeOut(duration: duration), value: isScaling)

            buildText("easeInOut")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(.easeInOut(duration: duration), value: isScaling)

            buildText("linear")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(.linear(duration: duration), value: isScaling)

            buildText("smooth")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(.smooth(duration: duration), value: isScaling)

            buildText("spring")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(
                    .spring(duration: 0.5, bounce: 0.5, blendDuration: 0.5),
                    value: isScaling
                )

            buildText("bouncy")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(
                    .bouncy(duration: duration - 0.4, extraBounce: 0.4),
                    value: isScaling
                )

            buildText("snappy")
                .offset(x: isScaling ? xOffset : -xOffset)
                .animation(
                    .snappy(duration: duration, extraBounce: 0.5),
                    value: isScaling
                )
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isScaling.toggle()
            }
        }
        .onChange(of: isScaling) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isScaling.toggle()
            }
        }
    }

    @ViewBuilder
    func buildText(_ text: String) -> some View {
        Text(text)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TranslatedText()
}
