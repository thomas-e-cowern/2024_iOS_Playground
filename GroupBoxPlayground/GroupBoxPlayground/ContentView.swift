//
//  ContentView.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    var isSunny: Bool = false
    
    var body: some View {
        VStack {
            GroupView(isSunny: false)
            Spacer()
                .frame(height: 50)
            GroupView(isSunny: true)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
