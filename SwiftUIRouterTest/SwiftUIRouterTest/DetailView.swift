//
//  DetailView.swift
//  SwiftUIRouterTest
//
//  Created by Thomas Cowern on 9/10/24.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var navPaths: [Routes]
    
    var name: String
    
    var body: some View {
        Text(name)
    }
}

#Preview {
    DetailView(navPaths: .constant([]), name: "Teddy")
}
