//
//  BudgetDetailScreen.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 8/9/24.
//

import SwiftUI
import Supabase

struct BudgetDetailScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.supabaseClient) private var supabase
    
    let budget: Budget
    
    @State private var name: String = ""
    @State private var limit: Float?
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter name", text: $name)
                TextField("Enter limit", value: $limit, format: .number)
                Button(action: {
                    // update action
                    Task {
                        await updateBudget()
                        dismiss()
                    }
                }, label: {
                    Text("Update")
                })
            }
            .onAppear {
                name = budget.name
                limit = budget.limit
            }
        }
        .navigationTitle(budget.name)
    }
    
    private func updateBudget() async {
        
        guard let limit = limit else { return }
        
        let updatedBudget = Budget(name: name, limit: limit)
        
        do {
            try await supabase
                .from("budgets")
                .update(updatedBudget)
                .eq("id", value: budget.id)
            .execute()
        } catch {
            print("Error updating updateBudget: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        BudgetDetailScreen(budget: Budget(name: "Groceries", limit: 500.0))
    }
}
