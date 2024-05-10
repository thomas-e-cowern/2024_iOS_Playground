//
//  EmptyStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import Foundation
import SwiftUI

struct EmptyStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
