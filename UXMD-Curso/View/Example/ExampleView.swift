//
//  ExampleView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 03/09/24.
//

import SwiftUI

struct Item: Identifiable {

    let id = UUID()
    let name: String
    let view: (any View)?
    let items: [Item]?

    init(_ name: String, items: [Item]? = nil, content: (() -> any View)? = nil) {
        self.name = name
        self.items = items
        self.view = content?()
    }
}

struct ExampleView: View {

    let views: [Item] = [
        .init(
            "Lottie",
            items: [
                .init("Atom") {
                    CustomLottieView(lottieName: "Lottie1")
                },
                .init("Coffee") {
                    CustomLottieView(lottieName: "Lottie2")
                },
                .init("Tree") {
                    CustomLottieView(lottieName: "Lottie3")
                },
            ]
        ),
        .init(
            "Code",
            items: [
                .init("Opacity") {
                    OpacityText()
                },
                .init("Scale") {
                    ScaledText()
                },
                .init("Position") {
                    TranslatedText()
                },
                .init("Notification Floater") {
                    NotificationFloater()
                },
            ]
        )
    ]

    var body: some View {
        NavigationView {
            ListView(items: views)
                .navigationTitle("Animations")
        }
    }
}

#Preview {
    ExampleView()
}
