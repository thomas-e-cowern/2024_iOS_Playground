//
//  TutorialView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct TutorialView: View {
    
    @State private var tutorials: [Tutorial] = []
    
    var body: some View {
        Text("Tutorial View")
    }
}

#Preview {
    TutorialView()
}
