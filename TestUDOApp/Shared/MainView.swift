//
//  MainView.swift
//  TestUDOApp
//
//  Created by Thomas Cowern on 6/26/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var chatText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Search...", text: $chatText)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                //action
            }, label: {
                Image(systemName: "paperplane.circle.fill")
                    .font(.title)
                    .rotationEffect(Angle(degrees: 45))
            })
            .buttonStyle(.borderless)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    MainView()
}
