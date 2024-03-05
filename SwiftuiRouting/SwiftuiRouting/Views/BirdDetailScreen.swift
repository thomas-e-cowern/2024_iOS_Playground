//
//  BirdDetailScreen.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct BirdDetailScreen: View {
    
    let name: String
    
    var body: some View {
        Text(name)
    }
}

#Preview {
    BirdDetailScreen(name: "Cardinal")
}
