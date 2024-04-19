//
//  CalculatorButtonsView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

struct CalculatorButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [ButtonRowModel] = [
        ButtonRowModel(row: [CalculatorButtonModel(calculatorButton: .clear,        color: foregroundTopButtonsColor),
            CalculatorButtonModel(calculatorButton: .negative, color: foregroundTopButtonsColor),
            CalculatorButtonModel(calculatorButton: .percent, color: foregroundTopButtonsColor),
                             CalculatorButtonModel(calculatorButton: .divide, color: .foregroundSideButtons)]),
        ButtonRowModel(row: [
            CalculatorButtonModel(calculatorButton: .seven),
            CalculatorButtonModel(calculatorButton: .eight),
            CalculatorButtonModel(calculatorButton: .nine),
            CalculatorButtonModel(calculatorButton: .multiply, color: .foregroundSideButtons)
        ]),
        ButtonRowModel(row: [
            CalculatorButtonModel(calculatorButton: .four),
            CalculatorButtonModel(calculatorButton: .five),
            CalculatorButtonModel(calculatorButton: .six),
            CalculatorButtonModel(calculatorButton: .add, color: .foregroundSideButtons)
        ]),
        ButtonRowModel(row: [
            CalculatorButtonModel(calculatorButton: .one),
            CalculatorButtonModel(calculatorButton: .two),
            CalculatorButtonModel(calculatorButton: .three),
            CalculatorButtonModel(calculatorButton: .subtract, color: .foregroundSideButtons)
        ]),
        ButtonRowModel(row: [
            CalculatorButtonModel(calculatorButton: .undo),
            CalculatorButtonModel(calculatorButton: .decimal),
            CalculatorButtonModel(calculatorButton: .zero),
            CalculatorButtonModel(calculatorButton: .equal, color: .foregroundSideButtons)
        ])
    ]
    
    var body: some View {
        Grid() {
            ForEach(buttonData) { rowModel in
                GridRow {
                    ForEach(rowModel.row) { buttonModel in
                        Button {
                            buttonPressed(calculatorButton: buttonModel.calculatorButton)
                        } label: {
                            ButtonView(calculatorButton: buttonModel.calculatorButton, fgColor: buttonModel.color, bgColor: buttonBackgroundColor)
                        }

                        
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.clipShape(RoundedRectangle(cornerRadius: 20)))
    }
    
    func buttonPressed(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            
        case .equal, .negative:
            print("Eq/Ne")
            if !currentComputation.isEmpty {
                if !lastCharIsAnOperator(str: currentComputation) {
                    let sign = calculatorButton == .negative ? -1.0 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if calculatorButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
        case .decimal:
            print("dec")
            if let lastOccuranceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(str: currentComputation) {
                    let startIndex = currentComputation.index(lastOccuranceOfDecimal, offsetBy: 1)
                    let endIndex = currentComputation.endIndex
                    let range = startIndex..<endIndex
                    let rightSubstring = String(currentComputation[range])
                    
                    // if only digits to right, do not add decimal, otherwise do...
                    if Int(rightSubstring) == nil && !rightSubstring.isEmpty {
                        currentComputation += "."
                    }
                }
            } else {
                if currentComputation.isEmpty {
                    currentComputation += ".0"
                } else if lastCharIsDigit(str: currentComputation) {
                    currentComputation += "."
                }
            }
        case .percent:
            print("per")
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calculatorButton: calculatorButton)
            }
        case .undo:
            print("Undo")
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .divide, .multiply:
            print("Operations")
            if lastCharIsDigitOrPercent(str:currentComputation) {
                appendToCurrentComputation(calculatorButton: calculatorButton)
            }
            
        default:
            print("Digits")
            currentComputation += calculatorButton.rawValue
        }
    }
    
    func appendToCurrentComputation(calculatorButton: CalculatorButton) {
        currentComputation += calculatorButton.rawValue
    }
    
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        
        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        
        if getLastCharacter(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
    }
}

#Preview("Light Mode") {
    CalculatorButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CalculatorButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
        .preferredColorScheme(.dark)
}
