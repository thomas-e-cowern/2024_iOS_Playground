//
//  StringHelperFunctions.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import Foundation

func getLastCharacter(str: String) -> String {
    if str.isEmpty {
        return ""
    } else {
        return String(str.last!)
    }
    
//    return str.isEmpty ? "" : String(str.last!)
}

func lastCharacterIsEqualTo(str: String, char: String) -> Bool {
    let last = getLastCharacter(str: str)
    
    return last == char
}

func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    
    let result = numberFormatter.string(from: NSNumber(value: val))
    
    return result ?? "0"
}

func lastCharIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastCharacter(str: str))
}
func lastCharIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastCharacter(str: str))
}
