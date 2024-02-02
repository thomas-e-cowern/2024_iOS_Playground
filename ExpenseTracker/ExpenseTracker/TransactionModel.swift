//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

