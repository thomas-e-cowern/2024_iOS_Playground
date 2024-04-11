//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack(alignment: .leading) {
                
                TitleView()
                
                Spacer()
      
                MessagesView()
                
                Spacer()
                
                Spacer()
                
            }
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    ContentView()
}
