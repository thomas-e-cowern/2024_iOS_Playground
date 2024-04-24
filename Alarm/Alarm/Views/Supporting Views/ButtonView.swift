//
//  ButtonView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct ButtonView: View {
    
    let text: LocalizedStringKey
    var endRadius = 40.0
    var scaleX = 3.0
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color.black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradientView(endRadius: endRadius,
                                scaleX: scaleX)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            )
    }
}

#Preview {
    ButtonView(text: "add alarm")
}
