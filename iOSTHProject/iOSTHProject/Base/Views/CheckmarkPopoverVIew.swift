//
//  CheckmarkPopoverVIew.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/23/24.
//

import SwiftUI

struct CheckmarkPopoverVIew: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle, design: .rounded).bold())
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    CheckmarkPopoverVIew()
}
