//
//  CreateView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/20/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = CreateViewModel()
    
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
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
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
        TextField("First Name", text: $vm.person.firstName)
    }
    
    var lastName: some View {
        TextField("Last Name", text: $vm.person.lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
    }
    
    var submit: some View {
        Button("Submit") {
            vm.createPerson()
        }
    }
    
    var done: some View {
        Button(action: {
            //
        }, label: {
            Text("Done")
        })
    }
}
