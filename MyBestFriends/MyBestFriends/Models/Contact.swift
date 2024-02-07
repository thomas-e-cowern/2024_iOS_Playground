//
//  Contact.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import Foundation
import CoreData

final class Contact: NSManagedObject, Identifiable {
    
    @NSManaged var dob: Date
    @NSManaged var email: String
    @NSManaged var favorite: Bool
    @NSManaged var name: String
    @NSManaged var notes: String
    @NSManaged var phone: String
    
    var isBirthday: Bool {
        Calendar.current.isDateInToday(dob)
    }
    
    var formattedName: String {
        "\(isBirthday ? "🎂" : "")\(name)"
    }
    
    var isValid: Bool {
        !name.isEmpty &&
        !email.isEmpty &&
        !phone.isEmpty
    }
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "favorite")
    }
    
}

extension Contact {
    
    private static var contactsFetchRequest: NSFetchRequest<Contact> {
        NSFetchRequest(entityName: "Contact")
    }
    
    static func all() -> NSFetchRequest<Contact> {
        let request: NSFetchRequest<Contact> = contactsFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Contact.name, ascending: true)
        ]
        
        return request
    }
    
    static func filter(with config: SearchConfig) -> NSPredicate {
        switch config.filter {
        case .all:
            return config.query.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "name CONTAINS[cd] %@", config.query)
        case .fave:
            return config.query.isEmpty ? NSPredicate(format: "favorite == %@", NSNumber(value: true)) :
            NSPredicate(format: "name CONTAINS[cd] %@ AND favorite == %@", config.query, NSNumber(value: true))
        }
        
    }
}

// This creates random contacts to use in previews during development
extension Contact {
    
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Contact] {
        
        var contacts: [Contact] = []
        
        for i in 0..<count {
            let contact = Contact(context: context)
            contact.name = "name \(i)"
            contact.email = "name\(i)@email.com"
            contact.favorite = Bool.random()
            contact.phone = "14\(i)-\(i)98-20\(i)5"
            contact.dob = Calendar.current.date(byAdding: .day, value: -i, to: .now) ?? .now
            contact.notes = "This is the note for contact \(i)"
            contacts.append(contact)
        }
        
        return contacts
    }
    
    static func preview(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return makePreview(count: 1, in: context)[0]
    }
    
    static func empty(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return Contact(context: context)
    }
    
    static func sort(order: Sort) -> [NSSortDescriptor] {
        [NSSortDescriptor(keyPath: \Contact.name, ascending: order == .asc)]
    }
    
}
