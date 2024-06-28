//
//  ChatView.swift
//  ChatGPTTestApp
//
//  Created by Thomas Cowern on 6/28/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Nothing there")
        }
        .padding()
    }
}

#Preview {
    ChatView()
}
