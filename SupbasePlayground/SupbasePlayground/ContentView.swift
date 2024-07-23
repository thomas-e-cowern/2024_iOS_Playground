//
//  ContentView.swift
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

struct ContentView: View {
    
    @Environment(\.supabaseClient) private var supabaseClient
    
    @State private var budgets: [Budget] = []
    
    var body: some View {
        List(budgets) { budget in
            BudgetCellView(budget: budget)

        }
        .padding()
        .task {
            await fetchBudgets()
//            do {
//                budgets = try await supabase.from("budgets").select().execute().value
//            } catch {
//                dump(error)
//            }
        }
    }
    
    private func fetchBudgets() async {
        do {
            budgets = try await supabaseClient.from("budgets").select().execute().value
        } catch {
            print("Error getting budget :|\(error.localizedDescription)")
        }
        
    }
}

#Preview {
    ContentView()
        .environment(\.supabaseClient, .development)
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
