//
//  IntroViewThree.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct IntroViewThree: View {
    var body: some View {
        VStack {
            Text("Intro View Three")
                .foregroundStyle(.white)
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    IntroViewThree()
}
