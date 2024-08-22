//
//  FEMAApplication.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import Foundation

struct FEMAApplication {
    var personal: Personal = Personal()
    var damage: Damage = Damage()
    var address: Address = Address()
}

struct Address {
    var address: String = ""
    var address2: String = ""
    var town: String = ""
    var state: String = ""
    var zipCode: String = ""
}

struct Personal {
    var firstName: String = ""
    var lasstName: String = ""
}

struct Damage {
    var type: String = ""
}

enum DamageType {
    case minor
    case major
    case catastrophic
    
    var damageText: String {
        switch self {
        case .minor: return "Minor Damage"
        case .major: return "Major Damage"
        case .catastrophic: return "Catastrophic Damage"
        }
    }
}
