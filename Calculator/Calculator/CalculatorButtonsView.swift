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
                            print("\(buttonModel.color) Button pressed")
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
}

#Preview("Light Mode") {
    CalculatorButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CalculatorButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
        .preferredColorScheme(.dark)
}
