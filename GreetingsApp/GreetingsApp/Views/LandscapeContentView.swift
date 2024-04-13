//
//  LandscapeContentView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct LandscapeContentView: View {
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            HStack {
                
                TitleView()
                
                Spacer()
      
                MessagesView()
                
            }
            .padding()
        }
    }
}

#Preview {
    LandscapeContentView()
}
