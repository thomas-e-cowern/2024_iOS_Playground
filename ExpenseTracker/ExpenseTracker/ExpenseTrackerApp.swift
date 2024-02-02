//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
