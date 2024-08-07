//
//  DestinationListingView.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    // SwiftData environment variables
    @Environment(\.modelContext)  var modelContext
    
    // SwiftData query variables
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    
    init(sort: [SortDescriptor<Destination>], searchString: String, minimumDate: Date) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return $0.date > minimumDate
            } else {
                return ($0.name.localizedStandardContains(searchString) || $0.sights.contains {
                        $0.name.localizedStandardContains(searchString)
                    }) && $0.date > minimumDate
            }
        }, sort: sort)
    }
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    HStack {
                        if destination.status == true {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.title)
                                .foregroundStyle(Color.green)
                                .padding(.trailing, 10)
                        }
                        VStack(alignment: .leading, content: {
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                            
                            switch destination.priority {
                            case 1:
                                Text("Priority: Meh")
                            case 2:
                                Text("Priority: Maybe")
                            case 3:
                                Text("Priority: Must")
                            default:
                                Text("Priority: Maybe")
                            }
                        })
                    }
                }
            }
            .onDelete(perform: deleteDestination)
        }
    }
    
    // Function to delete destination
    func deleteDestination(_ indexsSet: IndexSet) {
        for index in indexsSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: [SortDescriptor(\Destination.name)], searchString: "", minimumDate: .distantPast)
}
