//
//  LanguageOptionsView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct LanguageOptionsView: View {
    
    @Binding var language: String
    @Binding var layoutDirectionString: String
    
    var body: some View {
        
        Menu {
            Button("English") {
                language = "en"
                layoutDirectionString = LEFT_TO_RIGHT
            }
            Button("Italian") {
                language = "it"
                layoutDirectionString = LEFT_TO_RIGHT
            }
            Button("Arabic") {
                language = "ar"
                layoutDirectionString = RIGHT_TO_LEFT
            }

        } label: {
            Image(systemName: "gearshape.fill")
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    LanguageOptionsView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}
