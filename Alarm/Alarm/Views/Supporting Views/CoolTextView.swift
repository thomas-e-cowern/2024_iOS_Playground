//
//  CoolTextView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct CoolTextView: View {
    
    let fontName = "WorkSans-VariableFont_wght"
    let text: LocalizedStringKey
    let size: CGFloat
    
    var body: some View {
        Text(text)
            .font(Font.custom(fontName, size: size))
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
    }
}

#Preview {
    CoolTextView(text: "set alarm and\nwake up easily", size: 36)
}
