//
//  Sight.swift
//  iTour
//
//  Created by Thomas Cowern on 7/11/24.
//

import Foundation
import SwiftData

@Model
class Sight {
    var name: String
    var destination: Destination?

    init(name: String) {
        self.name = name
    }
}
