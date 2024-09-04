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

    init(name: String, view: (any View)? = nil, items: [Item]? = nil) {
        self.name = name
        self.view = view
        self.items = items
    }
}

struct ExampleView: View {

    let views: [Item] = [
        .init(
            name: "Lottie",
            view: nil, items: [
                .init(name: "Atom", view: CustomLottieView(lottieName: "Lottie1")),
                .init(name: "Coffee", view: CustomLottieView(lottieName: "Lottie2")),
                .init(name: "Tree", view: CustomLottieView(lottieName: "Lottie3")),
            ]
        )
    ]

    var body: some View {
        NavigationView {
            ListView(items: views)
        }
    }
}

#Preview {
    ExampleView()
}
