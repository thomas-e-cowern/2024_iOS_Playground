//
//  ContentView.swift
//  UITestingBootcamp
//
//  Created by Thomas Cowern on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                TextField(vm.placeholderTest, text: $vm.textFieldText)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button("Sign Up") {
                    // TODO: Add button functionality
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
