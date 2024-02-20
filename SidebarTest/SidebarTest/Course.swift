//
//  Course.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import Foundation

struct Course {
    let id = UUID()
    let name: String
    let description: String
    let courseNumber: Int
    
    var courseSampleData: [Course] {
        return [
            Course(name: "Early Indian Art", description: "Early Indian Art Description", courseNumber: 001),
            Course(name: "English for writers", description: "English for writers Description", courseNumber: 002),
            Course(name: "Intro to french", description: "Intro to french Description", courseNumber: 003)
        ]
    }
}
