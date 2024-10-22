//
//  Destination2View.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

struct Destination2View: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
}

#Preview {
    Destination2View(title: "Destination 2")
}
