//
//  SunAndMoonView.swift
//  Calculator
//
//  Created by Thomas Cowern on 4/16/24.
//

import SwiftUI

struct SunAndMoonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.max.fill")
                .imageScale(.large)
                .foregroundStyle(lightMode ? .sunAndMoonSelected : .sunAndMoonNotSelected)
            
            Image(systemName: "moon.fill")
                .imageScale(.large)
                .foregroundStyle(lightMode ? .sunAndMoonNotSelected : .sunAndMoonSelected)
        }
        .padding()
        .background(.secondaryBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview("Dark Mode") {
    return SunAndMoonView(lightMode: false)
}


#Preview("Light Mode") {
    SunAndMoonView(lightMode: true)
}
