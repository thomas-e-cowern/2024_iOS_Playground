//
//  MenuView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import SwiftUI

struct MenuView: View {
    
//    @State private var path: NavigationPath = NavigationPath()
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var cartManager = ShoppingCartManager()
    
    var body: some View {
        
        NavigationStack(path: $routerManager.routes) {
            
            List {
                
                Section("Foods") {
                    ForEach(foods) { food in
                        
                        NavigationLink(value: Route.menuItem(item: food)) {
                            MenuItemView(item: food)
                        }
                    }
                }
                
                Section("Drinks") {
                    ForEach(drinks) { drink in
                        
                        NavigationLink(value: Route.menuItem(item: drink)) {
                            MenuItemView(item: drink)
                        }
                    }
                }
                
                Section("Desserts") {
                    ForEach(desserts) { dessert in
                        
                        NavigationLink(value: Route.menuItem(item: dessert)) {
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
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .menuItem(let item):
                    switch item {
                    case is Food:
                        FoodDetailView(food: item as! Food)
                    case is Drink:
                        DrinkDetailView(drink: item as! Drink)
                    case is Dessert:
                        DessertDetailView(dessert: item as! Dessert)
                    default:
                        EmptyView()
                    }
                }
            }
        }
        .environmentObject(cartManager)
    }
}

#Preview {
    MenuView()
        .environmentObject(ShoppingCartManager())
}
