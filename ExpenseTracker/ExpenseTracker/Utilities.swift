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

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: •car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: •file_invoico_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: •film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: •hamburger)
    static let home = Category(id: 6, name: "Home", icon: •home)
    static let income = Category (id:7, name: "Income", icon: •dollar_sign)
    static let shopping = Category (id: name: "Shopping", icon: shopping_cart)
    static let transfer = Category (id: 9, name: "Transfer", icon: • exchange,alt)
    static let publicTransportation = Category (id: 101, name: "Public Transportation", icon: •bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: • taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: •mobile_alt, mainCategoryid: 2)
    static let moviesAndbVDs = Category (id: 301, name: "Movies & DVDs", icon: •film, mainCategoryId: 3)
    static let bankFee = Category (id: 401, name: "Bank Fee", icon: •hand_holding_usd, mainCategoryid: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: •hand_holding_usd, mainCategoryid: 4)
    static let groceries = Category (id: 501, name:"Groceries", icon: •shopping_basket, mainCategoryId: 4
    static let restaurants = Category(id: 502, name: "Restaurants", icon: utensils, mainCategoryid: 5)
    static let rent = Category(id: 601, name: "Rent", icon: house user, mainCategoryid: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: •lightbulb, mainCategoryid: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: •doller_sign, mainCategoryid: 7)
    static let software = Category(id: 801, name: "Software", icon: icons, mainCategoryid: 8)
                                     static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: "", mainCategoryid: 9)
}
