//
//  Utilities.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation
import SwiftUI

enum Theme {
    static let background = Color("Background")
    static let text = Color("Text")
    static let icon = Color("Icon")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        
        return parsedDate
    }
}
