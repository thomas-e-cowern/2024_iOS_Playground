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
    
    @State var budgets: [Budgets] = []
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Nothing there"
    
    var body: some View {
        List(budgets) { budget in
            HStack {
                Text(budget.name)
                Text("\(budget.limit)")
            }
        }
        .padding()
        .onAppear {
            
            connectToSupabase()
        }
        .task {
            do {
                budgets = try await supabase.from("budgets").select().execute().value
            } catch {
                dump(error)
            }
        }
    }
    
    func connectToSupabase () {
        let supabase = SupabaseClient(
          supabaseURL: URL(string: "https://xwtkxisitnsrfuqvpbld.supabase.co")!,
          supabaseKey: apiKey
        )
    }
}

#Preview {
    ContentView()
}
