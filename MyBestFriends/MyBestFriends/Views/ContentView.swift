//
//  ContentView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNewContact: Bool = false
    
    var provider = ContactsProvider.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0...19, id: \.self) { item in
                    
                    NavigationLink {
                        ContactDetailView()
                    } label: {
                        ContactRowView()
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
