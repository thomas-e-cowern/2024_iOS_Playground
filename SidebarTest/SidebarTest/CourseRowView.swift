//
//  CourseRowView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct CourseRowView: View {
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text(course.name)
                    .font(.title)
                Text("Course #: \(course.courseNumber, format: .number)")
                    .font(.subheadline)
            }
            Text(course.description)
        }
    }
}

#Preview {
    CourseRowView(course: Course(name: "Sepia Color Styles", description: "An examination of how color changes over time", courseNumber: 424))
}
