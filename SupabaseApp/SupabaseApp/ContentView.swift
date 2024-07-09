//
//  ContentView.swift
//  SupabaseApp
//
//  Created by Thomas Cowern on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Nothing there"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(apiKey)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
