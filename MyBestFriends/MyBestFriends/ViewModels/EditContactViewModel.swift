//
//  EditContactViewModel.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import Foundation
import CoreData

final class EditContactViewModel: ObservableObject {
    
    @Published var contact: Contact
    
    let isNew: Bool
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactsProvider, contact: Contact? = nil) {
        self.context = provider.newContext
        if let contact, let existingContactCopy = try? context.existingObject(with: contact.objectID) as? Contact {
            self.contact = existingContactCopy
            self.isNew = false
            
        } else {
            self.contact = Contact(context: self.context)
            self.isNew = true
        }
    }
    
    func save() throws {
        
        if context.hasChanges {
            
            try context.save()
        }
    }
}
