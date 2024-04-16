//
//  ComputationView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

struct ComputationView: View {
    
    let mainResult: String
    let currentComputation: String
    
    var body: some View {
        VStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

#Preview {
    ComputationView(mainResult: "6", currentComputation: "5 + 1")
}
