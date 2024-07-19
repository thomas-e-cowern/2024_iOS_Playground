//
//  QuestionView.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var question: Question
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.title)
                .padding(.bottom)
                .font(.headline)
            
            ForEach(question.choices, id: \.self) { choice in
                HStack {
                    Button {
                        print(choice)
                        question.selection = choice
                    } label: {
                        if question.selection == choice {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color("AppColor"))
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                    
                    Text(choice)
                }
                .foregroundStyle(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.horizontal)
        .frame(width: 300, height: 550, alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
    }
}

#Preview {
    QuestionView(question: .constant(Question(title: "Test title", answer: "A", choices: ["A", "B", "C"])))
}
