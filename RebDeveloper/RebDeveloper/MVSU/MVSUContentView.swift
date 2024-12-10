//
//  MVSUContentView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/10/24.
//

import SwiftUI

struct MVSUContentView: View {
    
    @Environment(AppService.self) private var appService
    
    var body: some View {
        
        @Bindable var appService = appService
        
        VStack {
            Text("Hello, \(appService.profile.name)")
            Button("Change Name") {
                appService.changeName()
            }
            TextField("Name", text: $appService.profile.name)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    MVSUContentView()
        .environment(AppService())
}
