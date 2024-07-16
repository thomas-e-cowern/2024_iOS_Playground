//
//  SightsView.swift
//  iTour
//
//  Created by Thomas Cowern on 7/16/24.
//

import SwiftUI
import SwiftData

struct SightsView: View {
    
    @Query(sort: \Sight.name) var sights: [Sight]
    
    var body: some View {
        NavigationStack {
            List(sights) { sight in
                NavigationLink(value: sight.destination) {
                    Text(sight.name)
                }
            }
            .navigationTitle("Sights")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
        }
    }
}

#Preview {
    SightsView()
}
