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
            Label {
                Text("Home")
                    .foregroundStyle(Color.red)
            } icon: {
                Image(systemName: "house")
            }
            .labelStyle(CircleLabelStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
