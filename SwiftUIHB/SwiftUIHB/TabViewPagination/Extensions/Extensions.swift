//
//  Extensions.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import Foundation

extension UserDefaults {
    var onboardingViewShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "onboardingViewShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "onboardingViewShown")
        }
    }
}
