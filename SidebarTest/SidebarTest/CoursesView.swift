//
//  CoursesView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct CoursesView: View {
    
    @State private var courses: [Course] = []
    
    var body: some View {
        Text("Courses View")
    }
}

#Preview {
    CoursesView()
}
