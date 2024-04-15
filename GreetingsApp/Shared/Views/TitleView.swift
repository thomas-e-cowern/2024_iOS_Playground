//
//  TitleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI
import TipKit

struct TitleView: View {
    
    @State private var subtitle: LocalizedStringKey = "Exploaring iOS Programming"
    @State private var isRotated: Bool = false
    
    private var greetingsTip = GreetingsTip()
    
    var body: some View {
        HStack {

            GreetingsTextView(subtitle: $subtitle)
                .popoverTip(greetingsTip)
            
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
