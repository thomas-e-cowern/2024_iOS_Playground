//
//  FourCoolCirclesView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct FourCoolCirclesView: View {
    
    var color1 = darkYellow
    var color2 = lightYellow
    
    @State private var offsetX: [CGFloat] = [0,0,0,0]
    @State private var offsetY: [CGFloat] = [0,0,0,0]
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
               
                CoolCircleView(
                    radius: geo.size.width / 10, 
                    color1: color1,
                    color2: color2
                )
                .offset(x: geo.size.width / 1.5, y: geo.size.height / 4)
                    .offset(x: offsetX[0], y: offsetY[0])
                
                CoolCircleView(
                    radius: geo.size.width / 7,
                    color1: color1,
                    color2: color2
                )
                .offset(x: geo.size.width / 8, y: geo.size.height / 2.5)
                    .offset(x: offsetX[1], y: offsetY[1])
                
                CoolCircleView(
                    radius: geo.size.width / 6,
                    color1: color1,
                    color2: color2
                )
                .offset(x: geo.size.width / 1.5, y: geo.size.height / 1.7)
                    .offset(x: offsetX[2], y: offsetY[2])
                
                CoolCircleView(
                    radius: geo.size.width / 5,
                    color1: color1,
                    color2: color2
                )
                .offset(x: geo.size.width / 8, y: geo.size.height / 1.3)
                    .offset(x: offsetX[3], y: offsetY[3])
            }
            .onReceive(timer, perform: { _ in
                withAnimation(.easeIn(duration: 10)) {
                    for i in 0..<offsetX.count {
                        offsetX[i] = Double.random(in: -300...300)
                    }
                    for i in 0..<offsetY.count {
                        offsetX[i] = Double.random(in: -300...300)
                    }
                }
            })
        }
    }
}

#Preview {
    FourCoolCirclesView()
}
