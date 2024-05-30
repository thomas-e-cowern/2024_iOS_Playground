//
//  ContentView.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HoveringLabel(style: HighlightLabelStyle.self) {
                Text("Home")
                    .font(.largeTitle)
            } icon: {
                Image(systemName: "house")
                    .font(.largeTitle)
            }
//            .labelStyle(CircleLabelStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
