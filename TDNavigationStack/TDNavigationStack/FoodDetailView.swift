//
//  FoodDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct FoodDetailView: View {
    
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

        }
        .navigationTitle("Item")
    }
}

#Preview {
    FoodDetailView(food: foods[0])
}
