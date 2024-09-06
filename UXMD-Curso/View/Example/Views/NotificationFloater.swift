//
//  NotificationFloater.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 05/09/24.
//

import SwiftUI

struct NotificationFloater: View {

    @State var showNotification = false
    @State var offset: CGFloat = -100
    @State var scale: CGFloat = 0.8
    let duration: TimeInterval = 0.300

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.triangle")

                    VStack(alignment: .leading) {
                        Text("Notification Floater Title")
                            .font(.headline)

                        Text("Notification Floater Subtitle")
                    }

                    Button {
                        showNotification = false
                    } label: {
                        Image(systemName: "multiply")
                    }
                }
                .padding()
                .background(.gray)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .opacity(showNotification ? 1 : 0)
                .animation(.linear(duration: duration), value: showNotification)
                .offset(y: offset)
                .animation(.easeOut(duration: duration), value: offset)
                .scaleEffect(scale)
                .animation(.easeIn(duration: duration * 0.8).delay(duration * 0.3), value: scale)
                .onChange(of: showNotification) { oldValue, newValue in
                    let delay = !showNotification ? duration : 0
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        offset = showNotification ? 0 : -100
                        scale = showNotification ? 1 : 0.8
                    }
                }

                Spacer()
            }

            Button {
                showNotification = true
            } label: {
                Text("Show notification")
            }
        }
    }
}

#Preview {
    NotificationFloater()
}
