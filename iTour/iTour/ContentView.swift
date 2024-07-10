//
//  ContentView.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)  var modelContext
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading, content: {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    })
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let miami = Destination(name: "Miami")
        let fortlauderdale = Destination(name: "Fort Lauderdale")
        let orlando = Destination(name: "Orlando")
        
        modelContext.insert(miami)
        modelContext.insert(fortlauderdale)
        modelContext.insert(orlando)
        
    }
}

#Preview {
    ContentView()
}
