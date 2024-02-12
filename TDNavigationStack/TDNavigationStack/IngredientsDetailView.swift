//
//  IngredientsDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import SwiftUI

struct IngredientsDetailView: View {
    
    let ingredients: [Ingredient]
    
    var body: some View {
        List(ingredients, id: \.name) { ingredient in
            LabeledContent {
                Text(ingredient.quantity / 100, format: .percent)
            } label: {
                Text(ingredient.name)
            }
        }
        .navigationTitle("Ingredients")
    }
}

#Preview {
    IngredientsDetailView(ingredients: foods[0].ingredients!)
}
