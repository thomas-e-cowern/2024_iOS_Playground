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
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(Color.digits)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundStyle(Color.digits)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ComputationView(mainResult: "135678", currentComputation: "12345 + 936")
}
