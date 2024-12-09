//
//  Cell.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/9/24.
//

import SwiftUI

struct Cell: View {
    
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        Color.clear
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(color)
                    .padding(6)
            }
            .overlay {
                Text(color.description)
                    .font(.largeTitle)
            }
    }
}

#Preview {
    Cell(color: .red)
}
