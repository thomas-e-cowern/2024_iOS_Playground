//
//  Note.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/29/24.
//

import Foundation
import SwiftData

@Model
class Note {
    var text: String
    var vegetable: Vegetable?
    
    init(text: String) {
        self.text = text
    }
}
