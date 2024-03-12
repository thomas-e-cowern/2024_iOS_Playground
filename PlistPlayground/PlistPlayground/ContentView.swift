//
//  ContentView.swift
//  PlistPlayground
//
//  Created by Thomas Cowern on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(apiKey ?? "No Key")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
