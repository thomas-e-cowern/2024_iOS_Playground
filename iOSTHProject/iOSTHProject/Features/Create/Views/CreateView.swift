//
//  CreateView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/20/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                
                firstName
                lastName
                job
                
                Section {
                    submit
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
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
    
    var done: some View {
        Button(action: {
            dismiss()
        }, label: {
            Text("Done")
        })
    }
}
