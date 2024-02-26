//
//  IntroViewTwo.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct IntroViewTwo: View {
    var body: some View {
        VStack {
            Text("Intro View Two")
                .foregroundStyle(.white)
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    IntroViewTwo()
}
