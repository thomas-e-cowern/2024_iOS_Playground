//
//  EditDestinationView.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    // SwiftData environment variables
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            Toggle(isOn: $destination.status) {
                Text("Visited")
            }
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sights") {
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
                .onDelete(perform: deleteSight)

                HStack {
                    TextField("Add a new sight in \(destination.name)", text: $newSightName)

                    Button("Add", action: addSight)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else { return }

        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
    
    // Function to delete destination
    func deleteSight(_ indexSet: IndexSet) {
        for index in indexSet {
            let sight = destination.sights[index]
            modelContext.delete(sight)
        }
    }
}

#Preview {
    do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Destination.self, configurations: config)

            let example = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
            return EditDestinationView(destination: example)
                .modelContainer(container)
        } catch {
            fatalError("Failed to create model container.")
        }
}