//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation

struct Transaction: Identifiable, Decodable {
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
    
    var signedAmout: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var icon: String {
        if let category = Category.all.first(where:  { $0.id == categoryId }) {
            return category.icon
        }
        
        return "pencil.and.scribble"
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: String
    var mainCategoryId: Int?
}

