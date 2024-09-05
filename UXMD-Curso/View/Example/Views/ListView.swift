//
//  ListView.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 03/09/24.
//

import SwiftUI

struct ListView: View {

    let items: [Item]
    
    var body: some View {
        List(items) { item in
            NavigationLink {
                if let items = item.items {
                    ListView(items: items)
                        .navigationTitle(item.name)
                } else if let view = item.view {
                    AnyView(view)
                        .navigationTitle(item.name)
                } else {
                    Text(item.name)
                        .navigationTitle(item.name)
                }
            } label: {
                Text(item.name)
            }
        }
    }
}

#Preview {
    Group {
        ListView(
            items: [
                .init("Test") {
                    Text("Test")
                }
            ]
        )

        ListView(
            items: [
                .init(
                    "Test",
                    items: Array(
                        repeating: .init("Test") {
                            Text("Test")
                        },
                        count: 5
                    )
                )
            ]
        )
    }
}
