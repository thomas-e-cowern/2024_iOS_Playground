//
//  TutorialRowView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct TutorialRowView: View {
    
    var tutorial: Tutorial
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text(tutorial.name)
                    .font(.title)
                Text("Course #: \(tutorial.tutorialNumber, format: .number)")
                    .font(.subheadline)
            }
            Text(tutorial.description)
        }
    }
}

#Preview {
    TutorialRowView(tutorial: Tutorial(name: "Using Windows 10", description: "How to use windows for beginners", tutorialNumber: 901))
}
