//
//  OnboardingContentView.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import SwiftUI

struct OnboardingContentView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var feature: Feature
    
    
    
    var body: some View {
        
        ZStack {
            
            Color.blue.opacity(0.5)
            
            VStack {
                Spacer()
                
                Image(feature.image)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                VStack {
                    Text(feature.title)
                        .font(.system(size: 36, weight: .bold))
                    
                    Text(feature.subtitle)
                    
                    Image("youtube")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: 100)
                    
                }
                
                Spacer()
                
                if feature.endOnboarding {
                    Button {
                        isOnboarding = false
                    } label: {
                        Text("Start")
                            .padding()
                            .background(
                                Capsule().strokeBorder(Color.blue, lineWidth: 1.5)
                                    .frame(width: 100)
                            )
                    }
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
    
    
}

#Preview {
    OnboardingContentView(feature: features[0])
}
