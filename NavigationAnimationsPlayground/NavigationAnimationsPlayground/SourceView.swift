//
//  SourceView.swift
//  NavigationAnimationsPlayground
//
//  Created by Thomas Cowern on 10/21/24.
//

import SwiftUI

struct SourceView: View {
    var body: some View {
        Color.teal
            .frame(width: 200, height: 200)
            .clipShape(.rect(cornerRadius: 25))
            .overlay {
                Image(systemName: "swift")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
    }
}
