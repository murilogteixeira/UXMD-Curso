//
//  OpacityText.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 05/09/24.
//

import SwiftUI

struct OpacityText: View {

    @State var isVisible = true
    let xOffset: CGFloat = 80
    let duration: TimeInterval = 1.5

    var body: some View {
        VStack(spacing: 32) {
            buildText("easeIn")
                .opacity(isVisible ? 1 : 0)
                .animation(.easeIn(duration: duration), value: isVisible)

            buildText("easeOut")
                .opacity(isVisible ? 1 : 0)
                .animation(.easeOut(duration: duration), value: isVisible)

            buildText("easeInOut")
                .opacity(isVisible ? 1 : 0)
                .animation(.easeInOut(duration: duration), value: isVisible)

            buildText("linear")
                .opacity(isVisible ? 1 : 0)
                .animation(.linear(duration: duration), value: isVisible)

            buildText("smooth")
                .opacity(isVisible ? 1 : 0)
                .animation(.smooth(duration: duration), value: isVisible)

            buildText("spring")
                .opacity(isVisible ? 1 : 0)
                .animation(
                    .spring(duration: 0.5, bounce: 0.5, blendDuration: 0.5),
                    value: isVisible
                )

            buildText("bouncy")
                .opacity(isVisible ? 1 : 0)
                .animation(
                    .bouncy(duration: duration - 0.4, extraBounce: 0.4),
                    value: isVisible
                )

            buildText("snappy")
                .opacity(isVisible ? 1 : 0)
                .animation(
                    .snappy(duration: duration, extraBounce: 0.5),
                    value: isVisible
                )
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isVisible.toggle()
            }
        }
        .onChange(of: isVisible) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                isVisible.toggle()
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
    OpacityText()
}
