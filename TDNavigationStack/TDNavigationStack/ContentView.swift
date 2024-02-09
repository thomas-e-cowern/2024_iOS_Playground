//
//  ContentView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                
                Section("Dessert") {
                    ForEach(desserts) { dessert in
                        NavigationLink(value: dessert) {
                            MenuItemView(item: dessert)
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
            .navigationDestination(for: Dessert.self) { dessert in
                DessertDetailView(dessert: dessert)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Surprise Me!") {
                        let items: [any Hashable] = foods + drinks + desserts
                        if let randomItem = items.randomElement() {
                            path.append(randomItem)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
