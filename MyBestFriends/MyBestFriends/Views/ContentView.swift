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
            ZStack {
                if !contacts.isEmpty {
                    List {
                        ForEach(contacts) { contact in
                            
                            NavigationLink {
                                ContactDetailView(contact: contact)
                            } label: {
                                ContactRowView(contact: contact)
                                    .swipeActions(allowsFullSwipe: true) {
                                        
                                        Button(role: .destructive) {
                                            do {
                                                try delete(contact)
                                            } catch {
                                                print("Error deleting contact: \(error.localizedDescription)")
                                            }
                                        } label: {
                                            Label(
                                                title: { Text("Delete") },
                                                icon: { Image(systemName: "trash") }
                                            )
                                        }
                                        .tint(.red)
                                        
                                        Button {
                                            //
                                        } label: {
                                            Label(
                                                title: { Text("Edit") },
                                                icon: { Image(systemName: "pencil") }
                                            )
                                        }
                                        .tint(.orange)
                                    }
                            }
                        }
                    }
                } else {
                    NoContactView()
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
        
#Preview("Contacts with data") {
    let preview = ContactsProvider.shared
    return ContentView(provider: preview)
        .environment(\.managedObjectContext, preview.viewContext)
        .onAppear {
            Contact.makePreview(count: 10, In: preview.viewContext)
        }
}

#Preview("Contacts with no data") {
    let emptyPreview = ContactsProvider.shared
    return ContentView(provider: emptyPreview)
        .environment(\.managedObjectContext, emptyPreview.viewContext)
}

private extension ContentView {
    func delete(_ contact: Contact) throws {
        let context = provider.viewContext
        let existingContact = try context.existingObject(with: contact.objectID)
        context.delete(existingContact)
        
        Task(priority: .background) {
            try await context.perform {
                try context.save()
            }
        }
        
    }
}
