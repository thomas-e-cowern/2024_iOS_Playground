//
//  CreateView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/20/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Field?
    @StateObject private var vm = CreateViewModel()
    
    let successfulAction: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    firstName
                    lastName
                    job
                } footer: {
                    if (vm.error != nil) {
                        Text(vm.error?.errorDescription ?? "")
                            .foregroundStyle(Color.red)
                    }
                }
                
                
                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
                    successfulAction()
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    // Do nothing
                }
            }
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                        .tint(.green)
                }
            }
        }
        
    }
}

#Preview {
    CreateView(successfulAction: {})
}

extension CreateView {
    enum Field: Hashable {
        case firstName
        case lastName
        case job
    }
}

private extension CreateView {
    var firstName: some View {
        TextField("First Name", text: $vm.person.firstName)
            .focused($focusedField, equals: .firstName)
    }
    
    var lastName: some View {
        TextField("Last Name", text: $vm.person.lastName)
            .focused($focusedField, equals: .lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
            .focused($focusedField, equals: .job)
    }
    
    var submit: some View {
        Button("Submit") {
            focusedField = nil
            vm.createPerson()
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
