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
                Section("Foods") {
                    ForEach(foods) { food in
                        NavigationLink(value: food) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        NavigationLink(value: drink) {
                            MenuItemView(item: drink)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
            .navigationDestination(for: Food.self) { food in
                FoodDetailView(food: food)
            }
            .navigationDestination(for: Drink.self) { drink in
                DrinkDetailView(drink: drink)
            }
        }
    }
}

#Preview {
    ContentView()
}
