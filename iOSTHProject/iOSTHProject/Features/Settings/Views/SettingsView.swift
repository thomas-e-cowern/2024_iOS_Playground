//
//  SettingsView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/24/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView(content: {
            Form {
                haptics
            }
            .navigationTitle("Settings")
        })
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    var haptics: some View {
        Toggle("Enable Haptics", isOn: .constant(true))
    }
}
