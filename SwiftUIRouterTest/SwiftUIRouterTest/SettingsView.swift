//
//  SettingsView.swift
//  SwiftUIRouterTest
//
//  Created by Thomas Cowern on 9/10/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var navPaths: [Routes]
    
    var body: some View {
        Text("Settings View")
    }
}

#Preview {
    SettingsView(navPaths: .constant([]))
}
