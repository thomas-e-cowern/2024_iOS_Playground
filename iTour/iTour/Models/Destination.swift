//
//  Destination.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    var status: Bool
    @Relationship(deleteRule: .cascade, inverse: \Sight.destination) var sights = [Sight]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2, status: Bool = false) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
        self.status = status
    }
}
