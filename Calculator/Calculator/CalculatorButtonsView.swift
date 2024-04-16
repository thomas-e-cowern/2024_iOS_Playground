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
    
    var body: some View {
        Text("Buttons view")
    }
}

#Preview {
    CalculatorButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
}
