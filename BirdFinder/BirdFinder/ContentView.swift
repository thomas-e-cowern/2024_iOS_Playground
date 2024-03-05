//
//  ContentView.swift
//  BirdFinder
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("👍👍👍👍 Observation Response below 👍👍👍👍")
            let observations: [BirdObservation] = try! StaticJSONMapper.decode(file: "StaticBirdData", type: [BirdObservation].self)
            dump(observations)
        }
    }
}

#Preview {
    ContentView()
}
