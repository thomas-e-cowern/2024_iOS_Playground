//
//  FoodItemView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct FoodItemView: View {
    
    let food: Food
    
    var body: some View {
        LabeledContent {
            Text(food.price,
                 format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(food.name) \(food.title)")
        }
    }
}

#Preview {
    FoodItemView(food: foods[0])
        .previewLayout(.sizeThatFits)
}
