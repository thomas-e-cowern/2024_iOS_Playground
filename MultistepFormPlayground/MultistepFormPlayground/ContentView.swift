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
                        Text("Damage")
                    case .address:
                        Text("Address")
                    case .review:
                        Text("Review")
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
