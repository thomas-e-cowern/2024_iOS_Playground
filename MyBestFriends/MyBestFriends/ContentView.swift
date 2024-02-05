//
//  ContentView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0...19, id: \.self) { item in
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Name")
                            .font(.system(size: 26, design: .rounded).bold())
                        
                        Text("Email")
                            .font(.callout.bold())
                        
                        Text("Phone Number")
                            .font(.callout.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .topTrailing) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "star")
                                .font(.title3)
                                .symbolVariant(.fill)
                                .foregroundStyle(Color.gray.opacity(0.3))
                        })
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
        
#Preview {
    ContentView()
}
