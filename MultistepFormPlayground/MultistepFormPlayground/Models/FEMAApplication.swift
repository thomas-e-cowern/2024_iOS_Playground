//
//  FEMAApplication.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import Foundation

struct FEMAApplication {
    var firstName: String = ""
    var lasstName: String = ""
    var damage: String = ""
    var address: Address = Address()
}

struct Address {
    var address: String = ""
    var address2: String = ""
    var town: String = ""
    var state: String = ""
    var zipCode: String = ""
}
