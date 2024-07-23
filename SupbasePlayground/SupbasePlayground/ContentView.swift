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
    
    @State var budgets: [Budgets] = []
    
    var body: some View {
        List(budgets) { budget in
            HStack {
                Text(budget.name)
                Text(String(format: "%.2f", budget.limit))
            }

        }
        .padding()
        .task {
            do {
                budgets = try await supabase.from("budgets").select().execute().value
            } catch {
                dump(error)
            }
        }
    }
    
    private func fetchBudgets() async {
        do {
            try await supabaseClient.from("budgets").select().execute().value
        } catch {
            print("Error getting budget :|\(error.localizedDescription)")
        }
        
    }
}

#Preview {
    ContentView()
        .environment(\.supabaseClient, .development)
}
