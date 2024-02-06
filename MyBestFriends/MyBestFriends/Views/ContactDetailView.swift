//
//  ContactDetailView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContactDetailView: View {
    
    let contact: Contact
    
    var body: some View {
        List {
            Section("General") {
                LabeledContent {
                    Text(contact.email)
                } label: {
                    Text("Email")
                }
                
                LabeledContent {
                    Text(contact.phone)
                } label: {
                    Text("Phone Number")
                }
                
                LabeledContent {
                    Text(.now, style: .date)
                } label: {
                    Text("\(contact.dob)")
                }
            }
            
            Section("notes") {
                Text(contact.notes)
            }
        }
        .navigationTitle(contact.formattedName)
    }
}

//#Preview {
//    NavigationStack {
//        ContactDetailView()
//    }
//}
