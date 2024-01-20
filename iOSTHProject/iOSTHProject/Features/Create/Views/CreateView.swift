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
            
            firstName
            lastName
            job
            
            Section {
                submit
            }
        }
    }
}

#Preview {
    CreateView()
}

private extension CreateView {
    var firstName: some View {
        TextField("First Name", text: .constant(""))
    }
    
    var lastName: some View {
        TextField("Last Name", text: .constant(""))
    }
    
    var job: some View {
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View {
        Button("Submit") {
            // TODO submit info to API
        }
    }
}
