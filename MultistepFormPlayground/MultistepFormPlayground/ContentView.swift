//
//  ContentView.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/21/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var currentStep: ApplicationStep = .personal
    @State private var femaApplication = FEMAApplication()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    
                    // Move to seperate view
                    switch currentStep {
                    case .personal:
                        PersonalInfoView(personal: $femaApplication.personal)
                    case .damage:
                        DamageView(damage: $femaApplication.damage)
                    case .address:
                        Text("Address")
                    case .review:
                        Text("Review")
                    }
                    
                    HStack {
                        Spacer()
                        Button("Previous") {
                            currentStep = currentStep.previous!
                        }
                        .disabled(currentStep.previous == nil)
                        
                        Spacer()
                        
                        Button("Next") {
                            currentStep = currentStep.next!
                        }
                        .disabled(currentStep.next == nil)
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationTitle(currentStep.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
