//
//  GRHome2.swift
//  HWSPlayground
//
//  Created by Thomas Cowern on 3/13/24.
//

import SwiftUI

struct GRHome2: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { number in
                    GeometryReader { geometry in
                        Text("Number \(number)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-geometry.frame(in: .global).minX / 8), axis: (x: 0, y: 1, z: 0)
                                )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    GRHome2()
}
