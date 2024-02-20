//
//  CoursesView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct CoursesView: View {
    
    @State private var courses: [Course] = [
        Course(name: "Early Indian Art", description: "Early Indian Art Description", courseNumber: 101),
        Course(name: "English for writers", description: "English for writers Description", courseNumber: 202),
        Course(name: "Intro to french", description: "Intro to french Description", courseNumber: 303)
    ]
    
    var body: some View {
        List {
            ForEach(courses, id: \.id) { course in
                CourseRowView(course: course)
            }
        }
    }
}

#Preview {
    CoursesView()
}
