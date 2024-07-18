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
                QuestionView(question: question)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
