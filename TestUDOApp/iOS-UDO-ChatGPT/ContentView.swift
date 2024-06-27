//
//  ContentView.swift
//  iOS-UDO-ChatGPT
//
//  Created by Thomas Cowern on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("API KEY : \(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Unavailable")")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
