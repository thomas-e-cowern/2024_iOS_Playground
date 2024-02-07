//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import SwiftUI

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: transaction.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }  //: End of VStack
            
            Spacer()
            
            // MARK: Transaction amount
            Text(transaction.signedAmout, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

#Preview("Transaction View Light") {
    
    TransactionRow(transaction: transationcPreviewData)
        .preferredColorScheme(.light)
}

#Preview("Transaction View Dark") {
    TransactionRow(transaction: transationcPreviewData)
        .preferredColorScheme(.dark)
}
