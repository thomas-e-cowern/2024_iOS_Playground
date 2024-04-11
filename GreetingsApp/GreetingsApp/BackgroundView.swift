//
//  BackgroundView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.blue, Color(red: 139/255, green: 80/255, blue: 240/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.2)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
