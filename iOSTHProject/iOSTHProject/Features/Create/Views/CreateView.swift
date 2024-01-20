//
//  CreateView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/20/24.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        Form {
            TextField("First Name", text: .constant(""))
            TextField("Last Name", text: .constant(""))
            TextField("Job", text: .constant(""))
            
            Section {
                Button("Submit") {
                    // TODO submit info to API
                }
            }
        }
    }
}

#Preview {
    CreateView()
}

private extension CreateView {
    
}
