//
//  Enumerations.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import Foundation

enum operation {
    case add, subtract, multiply, divide, equal, none
}

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrow.counterclockwise"
}

let enumOperators: [CalculatorButton] = [
    .subtract,
    .add,
    .divide,
    .multiply
]

let multiplySymbol: String = CalculatorButton.multiply.rawValue
let divisionSymbol: String = CalculatorButton.divide.rawValue

let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"
