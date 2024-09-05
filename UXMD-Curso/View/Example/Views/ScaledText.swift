//
//  ScaledText.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 05/09/24.
//

import SwiftUI

struct ScaledText: View {

    @State var isScaling = false

    var body: some View {
        VStack(spacing: 32) {
            Text("easeIn")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(.easeIn(duration: 1), value: isScaling)

            Text("easeOut")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(.easeOut(duration: 1), value: isScaling)

            Text("easeInOut")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(.easeInOut(duration: 1), value: isScaling)

            Text("linear")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(.linear(duration: 1), value: isScaling)

            Text("smooth")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(.smooth(duration: 1), value: isScaling)

            Text("spring")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(
                    .spring(duration: 0.5, bounce: 0.5, blendDuration: 0.5),
                    value: isScaling
                )

            Text("bouncy")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(
                    .bouncy(duration: 1, extraBounce: 0.5),
                    value: isScaling
                )

            Text("snappy")
                .scaleEffect(CGSize(width: isScaling ? 2 : 1, height: isScaling ? 2 : 1))
                .animation(
                    .snappy(duration: 1, extraBounce: 0.5),
                    value: isScaling
                )
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isScaling.toggle()
            }
        }
        .onChange(of: isScaling) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isScaling.toggle()
            }
        }
    }
}

#Preview {
    ScaledText()
}
