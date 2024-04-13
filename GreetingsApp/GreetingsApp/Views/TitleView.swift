//
//  TitleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct TitleView: View {
    
    @State private var subtitle: LocalizedStringKey = "Exploaring iOS Programming"
    @State private var isRotated: Bool = false
    
    var body: some View {
        HStack {

            GreetingsTextView(subtitle: $subtitle)
            
            Spacer()
            
            RotatableCircleView(isRotated: $isRotated)
        
        }
        
        Spacer()
    }
}

#Preview {
    TitleView()
        .padding()
}
