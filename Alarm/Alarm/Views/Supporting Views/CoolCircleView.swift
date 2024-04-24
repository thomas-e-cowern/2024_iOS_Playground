//
//  CoolCircleView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct CoolCircleView: View {
    
    let radius: CGFloat
    let color1: Color
    let color2: Color
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom)
            )
            .frame(width: radius, height: radius)
    }
}

#Preview {
    CoolCircleView(radius: 100.0, color1: yellow, color2: lightYellow)
}
