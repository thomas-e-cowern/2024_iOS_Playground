//
//  AddBudgetScreen.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/23/24.
//

import SwiftUI
import Supabase

struct AddBudgetScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.supabaseClient) private var supabase
    
    @State private var name: String = ""
    @State private var limit: Float?
    
    @Binding var budgets: [Budget]
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Amount", value: $limit, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Close")
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // add new budget
                    Task {
                        await saveBudget()
                    }
                }, label: {
                    Text("Save")
                })
            }
        }
    }
    
    private func saveBudget() async {
        
        guard let limit = limit else { return }
        
        let budget = Budget(name: name, limit: limit)
        
        do {
            let newBudget: Budget = try await supabase.from("budgets").insert(budget).select().single().execute().value
            
            budgets.append(newBudget)
            
            dismiss()
        } catch {
            print("Error in saveBudget: \(error.localizedDescription)")
        }
        
        
    }
}

#Preview {
    NavigationStack {
        AddBudgetScreen(budgets: .constant([]))
    }
}
