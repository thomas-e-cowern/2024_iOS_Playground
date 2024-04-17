//
//  ButtonView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import SwiftUI

struct ButtonView: View {
    
    let calculatorButton: CalculatorButton
    let fgColor: Color
    let bgColor: Color
    
    var systemImage: String? {
        let value = calculatorButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    var text: String? {
        let value = calculatorButton.rawValue
        
        return value.contains("IMG") ? nil : value
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    let buttonDimension: CGFloat = UIScreen.
}

#Preview {
    ButtonView(calculatorButton: .one, fgColor: .digits, bgColor: buttonBackgroundColor)
}
