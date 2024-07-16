//
//  ContentView.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // SwiftData environment variables
    @Environment(\.modelContext)  var modelContext
    
    // State variables
    @State private var path = [Destination]()
    @State private var sortOrder = [SortDescriptor(\Destination.name)]
    @State private var searchText = ""
    @State private var minimumDate = Date.distantPast
    let currentDate = Date.now
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText, minimumDate: minimumDate)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
//                    Button("Add Samples", action: addSamples)
                    Button("Add Destination", action: addDestination)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag([
                                    SortDescriptor(\Destination.name),
                                    SortDescriptor(\Destination.date),
                                ])

                            Text("Priority")
                                .tag([
                                    SortDescriptor(\Destination.priority, order: .reverse),
                                    SortDescriptor(\Destination.name),
                                ])

                            Text("Date")
                                .tag([
                                    SortDescriptor(\Destination.date),
                                    SortDescriptor(\Destination.name),
                                ])
                        }
                        .pickerStyle(.inline)
                        
                        Picker("Filter", selection: $minimumDate) {
                            Text("Show all destinations")
                                .tag(Date.distantPast)

                            Text("Show upcoming destinations")
                                .tag(currentDate)
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    // Functionas and methods supporting CRUD operations and sample data
//    func addSamples() {
//        let miami = Destination(name: "Miami")
//        let fortlauderdale = Destination(name: "Fort Lauderdale")
//        let orlando = Destination(name: "Orlando")
//        
//        modelContext.insert(miami)
//        modelContext.insert(fortlauderdale)
//        modelContext.insert(orlando)
//    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
