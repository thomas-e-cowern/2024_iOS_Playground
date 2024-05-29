//
//  DebugButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/29/24.
//

import Foundation
import SwiftUI

struct DebugButtonStyle: PrimitiveButtonStyle {
    
    let location: String
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            print("Button was pressed on line \(location)")
            configuration.trigger()
        } label: {
            configuration.label
        }
        .buttonStyle(DefaultButtonStyle())
    }
}
