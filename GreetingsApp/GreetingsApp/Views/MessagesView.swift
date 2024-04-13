//
//  MessagesView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct MessagesView: View {
    
    let messages: [DataItemModel] = [
        DataItemModel(text: "Hello World", color: .myGreen), 
        DataItemModel(text: "Welcome to swift", color: .myGrey),
        DataItemModel(text: "Are you ready to...", color: .yellow),
        DataItemModel(text: "Start exploring", color: .red),
        DataItemModel(text: "Awesome!", color: .myPurple)
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
