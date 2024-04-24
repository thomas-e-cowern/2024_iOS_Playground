//
//  CoolCircleView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct CoolCircleView: View {
    
    let radius: CGFloat
    let color1 = yellow
    let color2 = Color.clear
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom)
            )
            .frame(width: radius, height: radius)
    }
}

#Preview {
    CoolCircleView(radius: 100.0)
}
