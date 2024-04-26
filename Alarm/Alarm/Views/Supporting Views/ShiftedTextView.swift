//
//  ShiftedTextView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/26/24.
//

import SwiftUI

struct ShiftedTextView: View {
    
    let text: LocalizedStringKey
    var color: Color
    let xShift: Double
    
    var body: some View {
        Text(text)
            .foregroundStyle(color)
            .font(.subheadline)
            .offset(x: xShift)
    }
}

#Preview {
    ShiftedTextView(text: "alarm", color: .black, xShift: 10.0)
}
