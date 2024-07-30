//
//  CustomGroupBoxStyle.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import Foundation
import SwiftUI

struct CustomGroupBoxStyle: GroupBoxStyle {
    
    @Environment(\.colorScheme) var colorScheme
    
    var textColor: Color {
        if colorScheme == .dark {
            return .blue
        } else {
            print("Text color is black")
            return .black
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, content: {
            configuration.label
                .font(.headline)
                .foregroundStyle(textColor)
                .padding(.bottom, 4)
            configuration.content
                .padding()
                .background(Color.gray.opacity(0.1))
                .foregroundStyle(textColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        })
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}
