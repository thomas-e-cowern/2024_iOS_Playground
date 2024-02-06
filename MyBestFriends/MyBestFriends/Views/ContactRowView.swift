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
    
    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            Text("\(contact.isBirthday ? "🎂" : "")\(contact.name)")
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
            if moc.hasChanges {
                try moc.save()
            }
        } catch {
            print("Error in toggleFavorite: \(error.localizedDescription)")
        }
    }
}

//#Preview {
//    ContactRowView()
//}
