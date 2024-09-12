//
//  MessageView.swift
//  ShortDurationView
//
//  Created by Thomas Cowern on 9/12/24.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        Text("This is the message you will see for 2 seconds")
            .padding()
            .foregroundStyle(Color.white)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    MessageView()
}
