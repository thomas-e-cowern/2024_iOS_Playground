//
//  ContactsProvider.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import Foundation
import CoreData

final class ContactsProvider {
    
    static let shared = ContactsProvider()
    
    private let persistantContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistantContainer.viewContext
    }
    
    private init() {
        persistantContainer = NSPersistentContainer(name: "ContactsDataModel")
        persistantContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistantContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error.localizedDescription)")
            }
        }
        
    }
}

