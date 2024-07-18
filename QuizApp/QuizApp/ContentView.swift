//
//  ContentView.swift
//  QuizApp
//
//  Created by Thomas Cowern on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = QuizManager()
    
    var body: some View {
        TabView {
            ForEach(manager.mockQuestions, id: \.id) { question in
                VStack {
                    QuestionView(question: question)
                
                    if let lastQuestion = manager.mockQuestions.last, lastQuestion.id == question.id {
                        
                        Button(action: {
                            print("Submit")
                        }, label: {
                            Text("Submit")
                                .padding(10)
                                .padding(.horizontal)
                                .foregroundStyle(.white)
                                .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color("AppColor")).frame(width: 300))
                            
                                
                        })
                        .padding(.top, 10)
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
