//
//  QuizManager.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    @Published var mockQuestions = [
       Question(title: "When was the iPhone first released?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was Swift first used?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was mapkit released?", answer: "A", choices: ["A", "B", "C", "D"]),
       Question(title: "When was face iD released?", answer: "A", choices: ["A", "B", "C", "D"])
    ]
    
    func canSubmitQuiz() -> Bool {
        return mockQuestions.filter({ $0.selection == nil }).isEmpty
    }
    
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100) %"
    }
}
