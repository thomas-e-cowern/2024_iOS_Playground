//
//  TimeArcView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct TimeArcView: View {
    
    let percentDifference: CGFloat
    let strokeStyle: StrokeStyle
    let size: CGFloat
    let rotateCircleOffset: CGFloat
    let color: Color
    
    var body: some View {
        Circle()
            .trim(from: 0, to: percentDifference)
            .stroke(style: strokeStyle)
            .foregroundStyle(color)
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-90))
            .rotationEffect(.degrees(rotateCircleOffset))
    }
}

#Preview {
    TimeArcView(percentDifference: 0.5, strokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]), size: 250, rotateCircleOffset: 30, color: black)
}
