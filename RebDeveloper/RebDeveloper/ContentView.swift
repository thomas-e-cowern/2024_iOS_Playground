//
//  ContentView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorsArray: [[Color]] = [
        [.red, .blue, .green, .yellow],
        [.orange, .red, .blue, .green, .yellow],
        [.purple, .orange, .red, .blue, .green, .yellow]
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<colorsArray.count, id: \.self) { index in
                        Page(colorsArray[index], geometry: geo)
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ContentView()
}
