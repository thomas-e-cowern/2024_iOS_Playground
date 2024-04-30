//
//  CirclularTimeViewIcon.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/30/24.
//

import SwiftUI

struct CirclularTimeViewIcon: View {
    
    let time: Date
    let size: CGFloat
    let percent: CGFloat
    
    var circleFrame = 40.0
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: circleFrame, alignment: .center)
            .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)
            .overlay(
                TimeOfDayIcon(date: time)
            )
    }
}

#Preview {
    CirclularTimeViewIcon(time: Date(), size: 200, percent: 0.5)
}
