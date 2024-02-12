//
//  FoodDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct FoodDetailView: View {
    
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartManager: ShoppingCartManager
    let food: Food
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: food.name)
                LabeledContent("Name", value: food.title)
                LabeledContent {
                    Text(food.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
            }
            
            Section("Description") {
                Text(food.description)
            }
            
            if food.allergies?.isEmpty == false ||
               food.ingredients?.isEmpty == false {
                
                Section("Dietry") {
                    
                    if let ingredientsCount = food.ingredients?.count {
                        let countVw = Text("x\(ingredientsCount)").font(.footnote).bold()
                        Text("\(countVw) Ingredients")
                    }
                    
                    if let allergiesCount = food.allergies?.count {
                        let countVw = Text("x\(allergiesCount)").font(.footnote).bold()
                        Text("\(countVw) Allergies")
                    }
                }
            }
            
            if food.locations?.isEmpty == false {
                
                Section("Locations") {
                    
                    if let locationsCount = food.locations?.count {
                        let countVw = Text("x\(locationsCount)").font(.footnote).bold()
                        Text("\(countVw) Locations")
                    }
                }
            }

            Section {
                Button {
                    cartManager.add(food)
                    routerManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }

        }
        .navigationTitle(food.title)
    }
}

#Preview {
    FoodDetailView(food: foods[0])
        .environmentObject(ShoppingCartManager())
        .environmentObject(NavigationRouter())
}
