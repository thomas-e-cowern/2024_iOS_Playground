//
//  CreateContactView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct CreateContactView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var vm: EditContactViewModel
    
    @State private var hasError: Bool = false
    
    var body: some View {
        List {
            Section("General") {
                TextField("Name", text: $vm.contact.name)
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: $vm.contact.email)
                    .keyboardType(.emailAddress)
                
                TextField("Phone Number", text: $vm.contact.phone)
                    .keyboardType(.phonePad)
                
                DatePicker("Birthday", selection: $vm.contact.dob, displayedComponents: [.date  ])
                    .datePickerStyle(.compact)
                
                Toggle("Favorite", isOn: $vm.contact.favorite)
            }
            
            Section("notes") {
                TextField("", text: $vm.contact.notes, axis: .vertical)
            }
        }
        .navigationTitle(vm.isNew ? "New Contact" : "Update Contact")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    validate()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .alert("There appears to be an error", isPresented: $hasError, actions: {}) {
            Text("Name, email and phone number are required entries")
        }
    }
}

#Preview {
    NavigationStack {
        let preview = ContactsProvider.shared
        CreateContactView(vm: .init(provider: preview))
            .environment(\.managedObjectContext, preview.viewContext)
    }
}

private extension CreateContactView {
    func validate() {
        if vm.contact.isValid {
            do {
                try vm.save()
                dismiss()
            } catch {
                print("Error in validate: \(error.localizedDescription)")
            }
        } else {
            hasError = true
        }
    }
}
