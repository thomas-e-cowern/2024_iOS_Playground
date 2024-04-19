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
    let width: CGFloat
    
    var systemImage: String? {
        let value = calculatorButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    var text: String? {
        let value = calculatorButton.rawValue
        
        return value.contains("IMG") ? nil : value
    }
    
    var buttonDimension: CGFloat {
        width / 5
    }
    
    var body: some View {
        ZStack {
            if let text = text {
                Text(text)
            }
            
            if let systemImage = systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(UIDevice.isIPad ? .largeTitle.bold() : .title2)
        .fontWeight(UIDevice.isIPad ? .heavy : .semibold)
        .frame(width: buttonDimension, height: buttonDimension)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 2)
    }
    
    
}

#Preview("Light Mode") {
    ButtonView(calculatorButton: .undo, fgColor: .digits, bgColor: buttonBackgroundColor, width: 375)
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ButtonView(calculatorButton: .undo, fgColor: .digits, bgColor: buttonBackgroundColor, width: 375)
        .preferredColorScheme(.dark)
        
}
