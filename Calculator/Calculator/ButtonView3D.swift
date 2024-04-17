//
//  ButtonView3D.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/17/24.
//

import SwiftUI

struct ButtonView3D: View {
    let calculatorButton: CalculatorButton
    let fgColor: Color
    let bgColor: Color
    let faceColor: Color
    let topColor: Color
    let bottomColor: Color
    
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
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: buttonDimension, height: buttonDimension)
                .foregroundStyle(Gradient(colors: [buttonTopColor, buttonBottomColor]))
                .shadow(radius: 3)
            
            Circle()
                .frame(width: buttonDimension * 0.9)
                .foregroundStyle(buttonFaceColor)
                .shadow(radius: 3)
            
            Text(text ?? "")
                .font(.largeTitle)
            Image(systemName: systemImage ?? "")
            
            
        }
    }
    
}

#Preview("Light Mode") {
    ButtonView3D(calculatorButton: .eight, fgColor: .digits, bgColor: .gray, faceColor: .white, topColor: .white, bottomColor: .white)
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ButtonView3D(calculatorButton: .eight, fgColor: .digits, bgColor: buttonBackgroundColor, faceColor: .white, topColor: .white, bottomColor: .white)
        .preferredColorScheme(.dark)
        
}
