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
            VStack {
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
            }
            .padding(.top, 25)
        }
    }
}

#Preview {
    ContentView()
}
