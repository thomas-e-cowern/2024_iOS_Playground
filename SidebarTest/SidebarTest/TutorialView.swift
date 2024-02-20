//
//  TutorialView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct TutorialView: View {
    
    @State private var tutorials: [Tutorial] = [
        Tutorial(name: "Microsft Windows Tutorial", description: "Microsft Windows Tutorial Description", tutorialNumber: 901),
        Tutorial(name: "Mac OS Tutorial", description: "Mac OS Tutorial Description", tutorialNumber: 902),
        Tutorial(name: "Programming for morons", description: "Programming for morons Description", tutorialNumber: 903)
    ]
    
    var body: some View {
        List {
            ForEach(tutorials, id: \.id) { tutoial in
                TutorialRowView(tutorial: tutoial)
            }
        }
    }
}

#Preview {
    TutorialView()
}
