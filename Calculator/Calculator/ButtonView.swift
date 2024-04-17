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
    
    let buttonDimension: CGFloat = UIScreen.main.bounds.width / 5
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDimension, height: buttonDimension)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 2)
    }
    
    
}

#Preview("Light Mode") {
    ButtonView(calculatorButton: .undo, fgColor: .digits, bgColor: buttonBackgroundColor)
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ButtonView(calculatorButton: .undo, fgColor: .digits, bgColor: buttonBackgroundColor)
        .preferredColorScheme(.dark)
        
}
