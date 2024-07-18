//
//  Question.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    var id = UUID()
    let title: String
    let answer: String
    let choices: [String]
}
