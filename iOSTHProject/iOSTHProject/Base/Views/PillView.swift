//
//  PillView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import SwiftUI

struct PillView: View {
    
    let id: Int
    
    var body: some View {
        Text("#\(id)")
            .font(.system(.caption, design: .rounded).bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 9)
            .padding(.vertical, 4)
            .background(Theme.pill, in: Capsule())
    }
}

#Preview {
    PillView(id: 7)
}
