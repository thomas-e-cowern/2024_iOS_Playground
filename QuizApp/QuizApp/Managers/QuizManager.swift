//
//  QuizManager.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    var mockQuestions = [
       Question(title: "When was the iPhone first released?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was Swift first used?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was mapkit released?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was face iD released?", answer: "A", choices: ["A", "B", "C", "D"])
    ]
}
