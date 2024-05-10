//
//  ContentView.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("pressed")
        } label: {
            Text("Press me")
        }
        .buttonStyle(EmptyStyle())
        
        Button {
            print("pressed")
        } label: {
            Text("Press me")
        }
        .buttonStyle(ColoredButtonStyle(color: .green))
        
        Button {
            print("pressed")
        } label: {
            Text("Press me")
        }
        .buttonStyle(StripedRectangleButtonStyle())

    }
}

#Preview {
    ContentView()
}
