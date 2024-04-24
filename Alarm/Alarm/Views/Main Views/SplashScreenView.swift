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
                            CoolTextView(text: LocalizedStringKey("hello there!"), size: fontSize)
                            
                            CoolTextView(text: LocalizedStringKey("let's add an alarm"), size: fontSize)
                        }
                        .multilineTextAlignment(.leading)
                        .padding()
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                opacity = 1.0
                                fontSize = 36.0
                            }
                        }
                        
                        Spacer()
                        
                        Image(welcome)
                            .resizable()
                            .scaledToFit()
                            .opacity(0.7)
                        
                        Spacer()
                    }
                }
                .opacity(opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
                .onTapGesture {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
