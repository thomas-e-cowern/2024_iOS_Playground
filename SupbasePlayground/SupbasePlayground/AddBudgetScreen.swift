//
//  AddBudgetScreen.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/23/24.
//

import SwiftUI

struct AddBudgetScreen: View {
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Amount", value: $limit, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // add new budget
                }, label: {
                    Text("Save Budget")
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddBudgetScreen()
    }
}
