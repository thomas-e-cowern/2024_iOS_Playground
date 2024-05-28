//
//  ContentView.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 48) {
                Button {
                    print("pressed")
                } label: {
                    Text("Press me")
                }
                .buttonStyle(EmptyStyle())
                
                Button {
                    print("pressed")
                } label: {
                    Text("Press me")
                }
                .buttonStyle(ColoredButtonStyle(color: .green))
                
                Button {
                    print("pressed")
                } label: {
                    Text("Press me")
                }
                .buttonStyle(StripedRectangleButtonStyle())
                
                Button {
                    print("pressed")
                } label: {
                    Text("Press")
                }
                .buttonStyle(PushButtonStyle())
                
                Button {
                    print("pressed")
                } label: {
                    HStack {
                        Image(systemName: "phone.down.fill")
                        Text("End Call")
                    }
                }
                .buttonStyle(GlassButtonStyle(color: .classicRed))
                .padding(.horizontal)
                
                Button {
                    print("pressed")
                } label: {
                    Text("Press Me")
                        .font(.title)
                }
                .buttonStyle(AquaButtonStyle())
                
                ZStack {
                    Button {
                        print("pressed")
                    } label: {
                        Text("Press Me")
                            .font(.title)
                    }
                    .buttonStyle(FantasyButtonStyle())
                    .frame(width: 300)
                } //: End of ZStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ZStack {
                    Button {
                        print("Pressed")
                    } label: {
                        Image(systemName: "star")
                    }
                    .buttonStyle(TargetButton(glowColor: Color.green, strokeColor: Color.red))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                
                Button {
                    print("Animated Button Style")
                } label: {
                    Image(systemName: "star")
                }
                .buttonStyle(AnimatedButtonStyle())

                
            }
            .padding(.top, 25)
        }
    }
}

#Preview {
    ContentView()
}
