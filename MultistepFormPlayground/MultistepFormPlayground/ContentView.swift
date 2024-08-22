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
                        AddressView(address: $femaApplication.address)
                    case .review:
                        ReviewView(completedApplication: femaApplication)
                    }
                    
                    HStack {
                        Spacer()
                        Button("Previous") {
                            currentStep = currentStep.previous!
                        }
                        .disabled(currentStep.previous == nil)
                        
                        Spacer()
                        
                        Button(currentStep == .review ? "Submit" : "Next") {
                            
                            if currentStep == .review {
                                print("Submitted")
                                print("Personal Info: \(femaApplication.personal.firstName)")
                                print("Personal Info: \(femaApplication.personal.lasstName)")
                            } else {
                                currentStep = currentStep.next!
                            }
                        }
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
