//
//  MVSUContentView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/10/24.
//

import SwiftUI

struct MVSUContentView: View {
    
    @State private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, \(viewModel.profile.name)")
            Button("Change Name") {
                viewModel.changeName()
            }
        }
    }
}

#Preview {
    MVSUContentView()
}


extension MVSUContentView {
    
    @Observable
    class ViewModel {
        var profile: Profile = Profile()
        
        func changeName() {
            profile.name = "Thomas Cowern"
        }
    }
    
    
}
