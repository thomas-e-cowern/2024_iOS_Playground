//
//  ContentView.swift
//  SwiftUICampOct2024
//
//  Created by Thomas Cowern on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var privateData = "Hello World"
//    @State private var name = ""
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            Text(viewModel.name)
            MyTextField(name: $viewModel.name)
            Button("Tap me") {
//                privateData = "Hello SwiftUI camp"
//                name = "Bobby"
                viewModel.changeToBobby()
            }
            
            // Pull in view example
//            Text("Hi, I'm a preview!")
//                .background(Color.red)
            
            // Push out view example
//            Color.blue
//            Color.green
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

@Observable
class ContentViewModel {
    var name = ""
    
    func changeToBobby() {
        name = "Bobby"
    }
}
