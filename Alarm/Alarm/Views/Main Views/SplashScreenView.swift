//
//  SplashScreenView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive: Bool = false
    @State private var opacity: Double = 0.3
    @State private var fontSize: Double = 12.0
    
    var body: some View {
        VStack {
            if isActive {
                MainAlarmView()
            } else {
                ZStack {
                    FourCoolCirclesView(color1: .blue, color2: .clear)
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Inner Vstack")
                            Text("Let's add an alarm")
                        }
                        .multilineTextAlignment(.leading)
                        .padding()
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                opacity = 1.0
                                fontSize = 36.0
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
