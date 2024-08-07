//
//  ContentView.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = QuizManager()
    @State private var submitted: Bool = false
    
    var body: some View {
        TabView {
            ForEach(manager.mockQuestions.indices, id: \.self) { index in
                VStack {
                    if submitted {
                        Text("Score: \(manager.gradeQuiz())")
                            .font(.title)
                        .padding(.bottom, 12)
                    }
                    
                    QuestionView(question: $manager.mockQuestions[index])
                
                    if let lastQuestion = manager.mockQuestions.last, lastQuestion.id == $manager.mockQuestions[index].id {
                        
                        Button(action: {
                            print(manager.gradeQuiz())
                            submitted = true
                        }, label: {
                            Text("Submit")
                                .padding(10)
                                .padding(.horizontal)
                                .foregroundStyle(.white)
                                .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color("AppColor")).frame(width: 300))
                            
                                
                        })
                        .padding(.top, 10)
                        .buttonStyle(.plain)
                        .disabled(!manager.canSubmitQuiz())
                    }
                }
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
