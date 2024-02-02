//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation

var transationcPreviewData = Transaction(id: 1, date: "01/22/2024", institution: "Desjardines", account: "Visa Dejardines", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transationcPreviewData, count: 10)
