//
//  MenuView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import SwiftUI

struct MenuView: View {
    
    @State private var path: NavigationPath = NavigationPath()
    @StateObject private var cartManager = ShoppingCartManager()
    
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
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        
                        NavigationLink(value: dessert) {
                            MenuItemView(item: dessert)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartManager.items.count) {
                        
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: Food.self) { item in
                FoodDetailView(food: item)
            }
            .navigationDestination(for: Drink.self) { item in
                DrinkDetailView(drink: item)
            }
            .navigationDestination(for: Dessert.self) { item in
                DessertDetailView(dessert: item)
            }
        }
        .environmentObject(cartManager)
    }
}

#Preview {
    MenuView()
        .environmentObject(ShoppingCartManager())
}
