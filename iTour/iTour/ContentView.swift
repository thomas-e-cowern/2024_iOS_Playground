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
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading, content: {
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        })
                    }
                }
                .onDelete(perform: deleteDestination)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Samples", action: addSamples)
                Button("Add Destination", action: addDestination)
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
    
    func deleteDestination(_ indexsSet: IndexSet) {
        for index in indexsSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
