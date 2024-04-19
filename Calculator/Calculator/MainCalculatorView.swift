//
//  MainCalculatorView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

struct MainCalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        GeometryReader { geo in
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
                        .padding(.horizontal, UIDevice.isIPad ? geo.size.width * 0.1 : 10)
                    
                    Spacer()
                    
                    CalculatorButtonsView(currentComputation: $currentComputation, mainResult: $mainResult, width: geo.size.width)
                    
                    if UIDevice.isIPad {
                        Spacer()
                    }
                    
                }
            }
            .environment(\.colorScheme, lightMode ? .light : .dark)
        }
        
    }
}

#Preview {
    MainCalculatorView()
}
