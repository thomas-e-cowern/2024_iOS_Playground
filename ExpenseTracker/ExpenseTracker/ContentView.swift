//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Thomas Cowern on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Theme.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
    }
}

#Preview {
    Group {
        ContentView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    Group {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
