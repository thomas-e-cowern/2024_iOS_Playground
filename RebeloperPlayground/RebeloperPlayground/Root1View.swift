//
//  Root1View.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

struct Root1View: View {
    
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        List {
            NavigationLink(value: Root1NavigationLinkValues.destination1) {
                Text("Destination 1")
            }
            
            Button("Sheet Navigation") {
                isSheetPresented.toggle()
            }
            .sheet(isPresented: $isSheetPresented) {
                Root1NavigationLinkValues.destination1
                    .navigationLinkValues(Root1NavigationLinkValues.self)
            }
        }
        .navigationTitle("Root 1 View")
    }
}
