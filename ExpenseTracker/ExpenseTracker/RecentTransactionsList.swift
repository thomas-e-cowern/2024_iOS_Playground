//
//  RecentTransactionsList.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import SwiftUI

struct RecentTransactionsList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header title
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                // MARK: Navigation link
                NavigationLink {
                    //
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.text)
                }
            }
            .padding(.top)
            
            // MARK: Transactions list
            ForEach(transactionListVM.transactions) { transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
            }
        }
        .padding()
        .background(Theme.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return RecentTransactionsList()
        .environmentObject(transactionListVM)
        .preferredColorScheme(.light)
}

#Preview {
    
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return RecentTransactionsList()
        .environmentObject(transactionListVM)
        .preferredColorScheme(.dark)
}
