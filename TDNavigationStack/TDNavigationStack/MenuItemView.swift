//
//  FoodItemView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import SwiftUI

struct MenuItemView: View {
    
    let item: any MenuItem
    
    var body: some View {
        LabeledContent {
            Text(item.price,
                 format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(item.name) \(item.title)")
        }
    }
}

#Preview {
    MenuItemView(item: foods[0])
        .previewLayout(.sizeThatFits)
}
