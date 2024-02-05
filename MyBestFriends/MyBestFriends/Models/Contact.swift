//
//  Contact.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import Foundation
import CoreData

final class Contact: NSManagedObject {
    
    @NSManaged var dob: Date
    @NSManaged var email: String
    @NSManaged var favorite: Bool
    @NSManaged var name: String
    @NSManaged var notess: String
    @NSManaged var phone: String
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "favorite")
    }
    
}
