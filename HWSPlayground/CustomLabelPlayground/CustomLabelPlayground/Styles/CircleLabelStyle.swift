//
//  CircleLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

struct CircleLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .padding()
                .background(Color.accentColor)
                .foregroundStyle(Color.white)
                .clipShape(Circle())
            
            configuration.title
                .font(.largeTitle)
        }
    }
}
