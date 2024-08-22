//
//  ApplicationStep.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import Foundation

enum ApplicationStep {
    case personal
    case damage
    case address
    case review
    
    var title: String {
        switch self {
            case .personal: return "Personal Information"
            case .damage: return "Damage Information"
            case .address: return "Address Information"
            case .review: return "Review Application"
        }
    }
}
