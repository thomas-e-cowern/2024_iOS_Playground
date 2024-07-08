//
//  ContentView.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/8/24.
//

import SwiftUI
import Supabase

struct ContentView: View {
    
//    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Nothing there"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
