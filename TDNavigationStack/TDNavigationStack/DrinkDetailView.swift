//
//  DrinkDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/9/24.
//

import SwiftUI

struct DrinkDetailView: View {
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

            }
            .navigationTitle("Item")
        }
}

#Preview {
    DrinkDetailView(drink: drinks[1])
}
