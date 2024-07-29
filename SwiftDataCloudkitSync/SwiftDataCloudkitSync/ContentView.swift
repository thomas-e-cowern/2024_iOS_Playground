//
//  ContentView.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
               TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        <#code#>
                    }
                Spacer()
            }
            .padding()
            .navigationTitle("Garden Greens")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Vegetable.self])
}
