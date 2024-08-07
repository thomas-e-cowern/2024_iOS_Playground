//
//  BudgetListScreen.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/8/24.
//

import SwiftUI
import Supabase

struct Budgets: Decodable, Identifiable {
    var id: Int
    var name: String
    var limit: Float
}

struct BudgetListScreen: View {
    
    @Environment(\.supabaseClient) private var supabaseClient
    
    @State private var budgets: [Budget] = []
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(budgets) { budget in
                        BudgetCellView(budget: budget)
                    }
                    .onDelete(perform: { IndexSet in
                        guard let index = IndexSet.last else { return }
                        let budget = budgets[index]
                        Task {
                            await deleteBudget(budget)
                        }
                    })
                } // MARK: End of list
                .navigationTitle("Budgets")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Add budget
                            isPresented = true
                        }, label: {
                            Text("Add Budget")
                        })
                    }
                } //: End of toolbar
                .task {
                    await fetchBudgets()
                }
                .sheet(isPresented: $isPresented, content: {
                    NavigationStack {
                        AddBudgetScreen(budgets: $budgets)
                    }
                })  //: End of Sheet
            }
        } //: End of VStack
    }
    
    // Functions
    private func fetchBudgets() async {
        do {
            budgets = try await supabaseClient.from("budgets").select().execute().value
        } catch {
            print("Error getting budget : \(error.localizedDescription)")
        }
    }
    
    private func deleteBudget(_ budget: Budget) async {
        print("Deleting...")
        guard let id = budget.id else {
            print("Problem with id in deleteBudget")
            return
        }
        
        do {
            try await supabaseClient.from("budgets").delete().eq("id", value: id).execute()
            budgets = budgets.filter { $0.id! != id }
        } catch {
            print("Error deleting budget : \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
            .environment(\.supabaseClient, .development)
    }
}

struct BudgetCellView: View {
    
    let budget: Budget
    
    var body: some View {
        HStack {
            Text(budget.name)
            Spacer()
            Text(budget.limit, format: .currency(code: Locale.current.currency!.identifier))
        }
    }
}
