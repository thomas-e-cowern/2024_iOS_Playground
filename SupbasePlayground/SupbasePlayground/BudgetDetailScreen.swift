//
//  BudgetDetailScreen.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 8/9/24.
//

import SwiftUI

struct BudgetDetailScreen: View {
    
    let budget: Budget
    
    var body: some View {
        VStack {
            Text("more to come...")
        }
        .navigationTitle(budget.name)
    }
}

#Preview {
    NavigationStack {
        BudgetDetailScreen(budget: Budget(name: "Groceries", limit: 500.0))
    }
}
