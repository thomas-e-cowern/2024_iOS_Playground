//
//  ContentView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(foods) { food in
                    NavigationLink {
                        FoodDetailView(food: food)
                    } label: {
                        FoodItemView(food: food)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
