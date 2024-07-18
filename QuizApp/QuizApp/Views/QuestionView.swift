//
//  QuestionView.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question = Question(title: "When was the iPhone first released?", answer: "A", choices: ["A", "B", "C", "D"])
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.title)
                .padding(.bottom)
                .font(.headline)
            
            ForEach(question.choices, id: \.self) { choice in
                Text(choice)
            }
        }
        .padding(.horizontal)
        .frame(height: 550)
        .background(Color(uiColor: .systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
    }
}

#Preview {
    QuestionView()
}
