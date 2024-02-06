//
//  ContactRowView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContactRowView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var contact: Contact
    
    let provider: ContactsProvider
    
    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            Text(contact.formattedName)
                .font(.system(size: 26, design: .rounded).bold())
            
            Text(contact.email)
                .font(.callout.bold())
            
            Text(contact.phone)
                .font(.callout.bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                toggleFavorite()
            }, label: {
                Image(systemName: "star")
                    .font(.title3)
                    .symbolVariant(.fill)
                    .foregroundStyle(contact.favorite ? Color.yellow : Color.gray.opacity(0.3))
            })
            .buttonStyle(.plain)
        }
    }
}

private extension ContactRowView {
    
    func toggleFavorite() {
        contact.favorite.toggle()
        do {
            try provider.persist(in: moc)
        } catch {
            print("Error in toggleFavorite: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let previewProvider = ContactsProvider.shared
    return ContactRowView(contact: .preview(context: previewProvider.viewContext), provider: previewProvider)
}
