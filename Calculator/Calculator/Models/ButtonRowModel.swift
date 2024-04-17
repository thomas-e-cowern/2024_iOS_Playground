//
//  ButtonRowModel.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import Foundation

struct ButtonRowModel: Identifiable {
    let id = UUID()
    let row: [CalculatorButtonModel]
}
