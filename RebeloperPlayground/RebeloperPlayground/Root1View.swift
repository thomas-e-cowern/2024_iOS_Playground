//
//  Root1View.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

struct Root1View: View {
    var body: some View {
        List {
            NavigationLink(value: Root1NavigationLinkValues.destination1) {
                Text("Destination 1")
            }
        }
    }
}
