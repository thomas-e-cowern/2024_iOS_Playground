//
//  ContentView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNewContact: Bool = false
    
    @FetchRequest(fetchRequest: Contact.all(), animation: .default) var contacts
    
    var provider = ContactsProvider.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    
                    NavigationLink {
                        ContactDetailView(contact: contact)
                    } label: {
                        ContactRowView(contact: contact)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isShowingNewContact.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    })
                }
            }
            .sheet(isPresented: $isShowingNewContact, content: {
                NavigationStack {
                    CreateContactView(vm: .init(provider: provider))
                }
            })
            .navigationTitle("Contacts")
        }
    }
}
        
#Preview {
    ContentView()
}
