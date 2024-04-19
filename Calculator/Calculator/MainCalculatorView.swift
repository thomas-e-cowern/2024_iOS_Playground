//
//  MainCalculatorView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

struct MainCalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = "123 + 730"
    @State var mainResult: String = "1,234"
    
    var body: some View {
        ZStack {
            
            primaryBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                SunAndMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                
                
                Spacer()
                
                ComputationView(mainResult: mainResult, currentComputation: currentComputation)
                
                Spacer()
                
                CalculatorButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
                
            }
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

#Preview {
    MainCalculatorView()
}
