//
//  ContentView.swift
//  HWSNavigationStack
//
//  Created by Thomas Cowern on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    @State private var path2: [String] = ["1", "2", "3"]
    
    var body: some View {
        NavigationStack(path: $path2) {
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
                
                NavigationLink("Go to screen 4", value: "4")
                    .navigationDestination(for: String.self) { value in
                        Text("Sreen number \(value)")
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
