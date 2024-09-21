//
//  TabLabelStyle.swift
//  CustomTabBarTest
//
//  Created by Thomas Cowern on 9/21/24.
//

import Foundation
import SwiftUI

struct TabLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 4) {
            configuration.icon
                .dynamicTypeSize(.xxxLarge)
            configuration.title
                .font(.caption)
        }
    }
}
