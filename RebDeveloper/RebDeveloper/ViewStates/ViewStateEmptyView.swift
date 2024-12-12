//
//  ViewStateEmptyView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import SwiftUI

struct ViewStateEmptyView: View {
    
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ViewStateEmptyView(message: "This is the message")
}
