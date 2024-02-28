//
//  ContentView.swift
//  NavigationStackTutorial
//
//  Created by Thomas Cowern on 2/28/24.
//

import SwiftUI

struct CarBrand: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let name: String
}

struct Car: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let make: String
    let model: String
    let year: Int
    
    var descrtiption: String {
        return "\(year) \(make) \(model)"
    }
}

struct ContentView: View {
    
    let brands: [CarBrand] = [
        .init(name: "Chevy"),
        .init(name: "Ford"),
        .init(name: "Chrysler"),
        .init(name: "Pontiac")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Manufacturers") {
                    ForEach(brands) { brand in
                        NavigationLink(value: brand) {
                            Text(brand.name)
                        }
                    }
                }
            }
            .navigationDestination(for: CarBrand.self) { brand in
                Text("Welcome to \(brand.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
