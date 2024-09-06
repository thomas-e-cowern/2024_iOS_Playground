//
//  ContentView.swift
//  NavStackPractice
//
//  Created by Thomas Cowern on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var showDetails: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            // NavigationLink examples
            VStack {
                NavigationLink("This is screen number 1") {
                    Text("Go to screen 1")
                }
                Spacer().frame(height: 10)
                NavigationLink("This is screen number 2") {
                    Text("Go to screen 2")
                }
            } //: End of VStack
            
            Spacer()
                .frame(height: 20)
            
            // NavigationLink value examples
            VStack {
                NavigationLink("Go to screen 1", value: "1")
                Spacer().frame(height: 10)
                NavigationLink("Go to screen 2", value: "2")
                
            }.navigationDestination(for: String.self) { value in
                Text("This is screen number \(value)")
            } //: End of VStack
            
            Spacer()
                .frame(height: 20)
            
            // NavigationLink Boolean Examples
            VStack {
                Button("Update detail") {
                    showDetails = true
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                VStack {
                    Text("Deails was updated")
                    Button("close") {
                        showDetails = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
