//
//  VerticalTitleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct VerticalTitleView: View {
    @State private var subtitle: LocalizedStringKey = "Exploring iOS Programming"
    @State private var isRotated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {

            GreetingsTextView(subtitle: $subtitle)
            
            RotatableCircleView(isRotated: $isRotated)
            
            Spacer()
        
        }
    }
}

#Preview {
    VerticalTitleView()
}
