//
//  ContentView.swift
//  UITestingBootcamp
//
//  Created by Thomas Cowern on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if vm.currentUserIsSignedIn {
                 Text("Signed In dude!")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .trailing))
            } else {
                signUpLayer
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#Preview {
    ContentView()
}
