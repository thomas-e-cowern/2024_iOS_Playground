//
//  MainGradientView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct MainGradientView: View {
    var startRadius: CGFloat = 0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad: CGFloat = 0.5
    var opacityRadGrad: CGFloat = 1.0
    var yellowColor = yellow
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [blue, purple, pink], startPoint: .top, endPoint: .bottom)
                .opacity(opacityLinGrad)
            
            RadialGradient(colors: [yellowColor, .clear], center: .bottom, startRadius: startRadius, endRadius: endRadius)
                .opacity(opacityRadGrad)
                .scaleEffect(x: scaleX)
        }
    }
}

#Preview {
    MainGradientView(endRadius: 75)
}
