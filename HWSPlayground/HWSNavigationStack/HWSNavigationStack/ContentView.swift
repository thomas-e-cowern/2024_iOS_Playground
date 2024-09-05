//
//  ContentView.swift
//  HWSNavigationStack
//
//  Created by Thomas Cowern on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
