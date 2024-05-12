//
//  View+Extensions.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/12/24.
//

import Foundation
import SwiftUI

extension View {
    public func foregroundMask<Content: View>(_ overlay: Content) -> some View {
        self
            .overlay(overlay)
            .mask(self)
    }
}
