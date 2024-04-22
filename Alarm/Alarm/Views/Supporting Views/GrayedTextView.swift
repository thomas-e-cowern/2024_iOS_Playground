//
//  GrayedTextView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/22/24.
//

import SwiftUI

struct GrayedTextView: View {
    
    let text: LocalizedStringKey
    let font = Font.headline
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundStyle(Color.gray)
            .font(font)
        }
        .padding()
    }
}

#Preview {
    GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.")
}
