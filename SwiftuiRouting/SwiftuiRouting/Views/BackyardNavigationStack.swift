//
//  BackyardNavigationStack.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct BackyardNavigationStack: View {
    var body: some View {
        NavigationStack {
            List(1...10, id: \.self) { index in
                NavigationLink {
                    Text("Backyard Detail \(index)")
                } label: {
                    Text("Backyard \(index)")
                }
            }.navigationTitle("Backyards")
        }
    }
}

#Preview {
    BackyardNavigationStack()
}
