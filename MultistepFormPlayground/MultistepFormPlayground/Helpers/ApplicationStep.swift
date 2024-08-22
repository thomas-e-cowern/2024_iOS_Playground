//
//  ApplicationStep.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import Foundation
import SwiftUI

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
    
    var previous: ApplicationStep? {
        switch self {
        case .personal: return nil
        case .damage: return .personal
        case .address: return .damage
        case .review: return .address
        }
    }
    
    var next: ApplicationStep? {
        switch self {
        case .personal: return .damage
        case .damage: return .address
        case .address: return .review
        case .review: return nil
        }
    }
}

extension View {
    func centerButtonsHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
