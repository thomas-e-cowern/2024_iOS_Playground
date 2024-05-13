//
//  TargetButton.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/13/24.
//

import Foundation
import SwiftUI

struct TargetButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
