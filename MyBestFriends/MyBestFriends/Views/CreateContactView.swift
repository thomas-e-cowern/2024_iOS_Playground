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
        .navigationTitle("Name Here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        try vm.save()
                        dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
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
