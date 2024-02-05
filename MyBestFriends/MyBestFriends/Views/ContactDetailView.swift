//
//  ContactDetailView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContactDetailView: View {
    var body: some View {
        List {
            Section("General") {
                LabeledContent {
                    Text("Email here")
                } label: {
                    Text("Email")
                }
                
                LabeledContent {
                    Text("Phone number here")
                } label: {
                    Text("Phone Number")
                }
                
                LabeledContent {
                    Text(.now, style: .date)
                } label: {
                    Text("Birthday")
                }
            }
            
            Section("notes") {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In pellentesque massa placerat duis ultricies. Habitant morbi tristique senectus et netus et malesuada fames ac. Ultricies tristique nulla aliquet enim tortor at auctor. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi.")
            }
        }
        .navigationTitle("Name Here")
    }
}

#Preview {
    NavigationStack {
        ContactDetailView()
    }
}
