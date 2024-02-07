//
//  ContentView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct SearchConfig: Equatable {
    
    enum filter {
        case all, fave
    }
    
    var filter: filter = .all
    var query: String = ""
}

enum Sort {
    case asc, desc
}

struct ContentView: View {
    
    @State private var isShowingNewContact: Bool = false
    @State private var contactToEdit: Contact?
    @State private var searchConfig: SearchConfig = .init()
    @State private var sort: Sort = .asc
    
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
                                ContactRowView(contact: contact, provider: provider)
                                    .swipeActions(allowsFullSwipe: true) {
                                        
                                        Button(role: .destructive) {
                                            do {
                                                try provider.delete(contact, in: provider.newContext)
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
                                            contactToEdit = contact
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
            .searchable(text: $searchConfig.query)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        contactToEdit = .empty(context: provider.newContext)
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Section {
                            Text("Filter")
                            Picker(selection: $searchConfig.filter) {
                                Text("All").tag(SearchConfig.filter.all)
                                Text("Favorites").tag(SearchConfig.filter.fave)
                            } label: {
                                Text("Filter Favorites")
                            }

                        }
                        
                        Section {
                            Text("Sort")
                            Picker(selection: $sort) {
                                Label("Ascending", systemImage: "arrow.up").tag(Sort.asc)
                                Label("Descending", systemImage: "arrow.down").tag(Sort.desc)
                            } label: {
                                Text("Sort By")
                            }

                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .symbolVariant(.circle)
                            .font(.title2)
                    }
                }
            }
            .sheet(item: $contactToEdit, onDismiss: {
                contactToEdit = nil
            }, content: { contact in
                NavigationStack {
                    CreateContactView(vm: .init(provider: provider, contact: contact))
                }
            })
            .navigationTitle("Contacts")
            .onChange(of: searchConfig) { _, newValue in
                contacts.nsPredicate = Contact.filter(with: newValue)
            }
            .onChange(of: sort) { _, newSort in
                contacts.nsSortDescriptors = Contact.sort(order: newSort)
            }
        }
    }
}
        
#Preview("Contacts with data") {
    let preview = ContactsProvider.shared
    return ContentView(provider: preview)
        .environment(\.managedObjectContext, preview.viewContext)
        .onAppear {
            Contact.makePreview(count: 10, in: preview.viewContext)
        }
}

#Preview("Contacts with no data") {
    let emptyPreview = ContactsProvider.shared
    return ContentView(provider: emptyPreview)
        .environment(\.managedObjectContext, emptyPreview.viewContext)
}
