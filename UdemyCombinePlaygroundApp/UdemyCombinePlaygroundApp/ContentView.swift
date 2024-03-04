//
//  ContentView.swift
//  UdemyCombinePlaygroundApp
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI
import Combine



struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.bottom, 10)
            Text("\(vm.value)")
        }
        .padding()
        .onDisappear {
            
        }
    }
}

#Preview {
    ContentView()
}
