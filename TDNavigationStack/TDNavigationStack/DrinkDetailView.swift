//
//  DrinkDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/9/24.
//

import SwiftUI

struct DrinkDetailView: View {
    
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartManager: ShoppingCartManager
    let drink: Drink
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: drink.name)
                LabeledContent("Name", value: drink.title)
                LabeledContent {
                    Text(drink.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
                LabeledContent("Fizzy?", value: drink.isFizzy ? "✅" : "❌")
            }
            
            Section("Description") {
                Text(drink.description)
            }
            
            if drink.allergies?.isEmpty == false ||
                drink.ingredients?.isEmpty == false {
                
                Section("Dietry") {
                    
                    if let ingredientsCount = drink.ingredients?.count {
                        let countVw = Text("x\(ingredientsCount)").font(.footnote).bold()
                        Text("\(countVw) Ingredients")
                    }
                    
                    if let allergiesCount = drink.allergies?.count {
                        let countVw = Text("x\(allergiesCount)").font(.footnote).bold()
                        Text("\(countVw) Allergies")
                    }
                }
            }
            
            if drink.locations?.isEmpty == false {
                
                Section("Locations") {
                    
                    if let locationsCount = drink.locations?.count {
                        let countVw = Text("x\(locationsCount)").font(.footnote).bold()
                        Text("\(countVw) Locations")
                    }
                }
            }
            
            
            Section {
                Button {
                    cartManager.add(drink)
                    routerManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }
            
        }
        .navigationTitle(drink.title)
    }
}

#Preview {
    DrinkDetailView(drink: drinks[1])
        .environmentObject(ShoppingCartManager())
        .environmentObject(NavigationRouter())
}
