//
//  Destination1View.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//
import SwiftUI

struct Destination1View: View {
    
    var random = Int.random(in: 0...100)
    
    var body: some View {
        List {
            NavigationLink(value: Root1NavigationLinkValues.destination2(title: "\(random)")) {
                Text("Go to \(random)")
            }
        }
    }
}
