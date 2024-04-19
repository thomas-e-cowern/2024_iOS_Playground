//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.isIPad {
                Text("iPad")
            } else {
                Text("iPhone")
                MainCalculatorView()
            }
        }
    }
}
