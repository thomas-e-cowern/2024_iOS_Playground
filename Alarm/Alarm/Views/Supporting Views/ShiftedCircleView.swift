//
//  ShiftedCircleView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/26/24.
//

import SwiftUI

struct ShiftedCircleView: View {
    
    let color: Color
    let xShift: Double
    var padding: Double = 7.0
    
    var body: some View {
        Circle()
            .fill(color)
            .padding(padding)
            .offset(x: xShift)
    }
}

#Preview {
    ShiftedCircleView(color: .background, xShift: 10.0)
}
