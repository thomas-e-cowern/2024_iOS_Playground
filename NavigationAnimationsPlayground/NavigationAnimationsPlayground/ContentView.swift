//
//  ContentView.swift
//  NavigationAnimationsPlayground
//
//  Created by Thomas Cowern on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            NavigationLink {
                DestinationView()
                    .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
            } label: {
                SourceView()
                    .matchedTransitionSource(id: "zoom", in: namespace)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
