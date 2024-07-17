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
                Text("\(budget.limit)")
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
}

#Preview {
    ContentView()
        .environment(\.supabaseClient, .development)
}
