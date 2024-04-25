//
//  AboutView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/25/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                MainGradientView(endRadius: geo.size.height / 2)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 30) {
                        CoolTextView(text: LocalizedStringKey("About"), size: 48)
                        Text("The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.1)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Image(appImagesSamples)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: geo.size.width * 0.8)
                    
                    Spacer()
                    
                    if let url = URL(string: "https://leogky.com") {
                        Link(destination: url, label: {
                            CoolTextView(text: LocalizedStringKey("To Anton's Page"), size: 24)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
