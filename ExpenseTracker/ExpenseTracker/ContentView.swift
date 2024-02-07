//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK:
                    RecentTransactionsList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Theme.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
    }
}

#Preview("Content View Light") {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return ContentView()
        .environmentObject(transactionListVM)
        .preferredColorScheme(.light)
    
}

#Preview("Content View Dark") {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return ContentView()
        .environmentObject(transactionListVM)
        .preferredColorScheme(.dark)
    
}
