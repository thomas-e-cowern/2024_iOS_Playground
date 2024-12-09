//
//  Page.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/9/24.
//

import SwiftUI

struct Page: View {
    
    let colors: [Color]
    let geometry: GeometryProxy
    
    init(_ colors: [Color], geometry: GeometryProxy) {
        self.colors = colors
        self.geometry = geometry
    }
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(0..<colors.count, id: \.self) { index in
                        Cell(colors[colors.count - index - 1])
                            .frame(width: geometry.size.width, height: 300)
                    }
                }
            }
            .frame(height: geometry.size.height - 100)
            
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<colors.count, id: \.self) { index in
                            Cell(colors[index])
                                .frame(width: 160, height: 100)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
