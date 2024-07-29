//
//  Vegetable.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/29/24.
//

import Foundation
import SwiftData

@Model
class Vegetable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
