//
//  AnimatedButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/28/24.
//

import Foundation
import SwiftUI


struct AnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
