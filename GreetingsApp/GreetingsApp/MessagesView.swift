//
//  MessagesView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct MessagesView: View {
    
    let messages: [DataItemModel] = [
        DataItemModel(text: "Hello World", color: .green), DataItemModel(text: "Welcome to swift", color: .orange), DataItemModel(text: "Are you ready to...", color: .yellow), DataItemModel(text: "Start exploring", color: .red), DataItemModel(text: "Awesome!", color: .purple)
    ]
    
    var body: some View {
        ForEach(messages, id: \.id) { message in
            TextView(text: message.text, color: message.color)
        }
    }
}

#Preview {
    MessagesView()
}
