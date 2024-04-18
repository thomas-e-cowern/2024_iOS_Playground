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
                             CalculatorButtonModel(calculatorButton: .divide, color: foregroundTopButtonsColor)]),
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
                            buttonPressed(calulatorButton: buttonModel.calculatorButton)
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
    
    func buttonPressed(calulatorButton: CalculatorButton) {
        switch calulatorButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            
        case .equal, .negative:
            print("Eq/Ne")
        case .decimal:
            print("dec")
        case .percent:
            print("per")
        case .undo:
            print("Undo")
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .divide, .multiply:
            print("Operations")
            if lastCharIsDigit(str:currentComputation) {
                currentComputation += calulatorButton.rawValue
            }
            
        default:
            print("Digits")
            currentComputation += calulatorButton.rawValue
        }
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
