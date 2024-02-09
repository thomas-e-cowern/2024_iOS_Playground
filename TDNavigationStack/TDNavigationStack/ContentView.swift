//
//  ContentView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(foods) { food in
                    NavigationLink(food.title, value: food.price)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            .navigationDestination(for: Decimal.self) { foodPrice in
                Text(foodPrice, format: .currency(code: "USD"))
            }
        }
    }
}

#Preview {
    ContentView()
}
