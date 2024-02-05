//
//  CreateContactView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct CreateContactView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            Section("General") {
                TextField("Name", text: .constant(""))
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: .constant(""))
                    .keyboardType(.emailAddress)
                
                TextField("Phone Number", text: .constant(""))
                    .keyboardType(.phonePad)
                
                DatePicker("Birthday", selection: .constant(.now), displayedComponents: [.date  ])
                    .datePickerStyle(.compact)
                
                Toggle("Favorite", isOn: .constant(true))
            }
            
            Section("notes") {
                TextField("", text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In pellentesque massa placerat duis ultricies. Habitant morbi tristique senectus et netus et malesuada fames ac. Ultricies tristique nulla aliquet enim tortor at auctor. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi."), axis: .vertical)
            }
        }
        .navigationTitle("Name Here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
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
        CreateContactView()
    }
}
