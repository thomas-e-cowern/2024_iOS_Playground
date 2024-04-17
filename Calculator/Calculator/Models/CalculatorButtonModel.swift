//
//  CalculatorButtonModel.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import Foundation
import SwiftUI

struct CalculatorButtonModel: Identifiable {
    let id = UUID()
    let calculatorButton: CalculatorButton
    var color: Color = foregroundDigitsColor
}
