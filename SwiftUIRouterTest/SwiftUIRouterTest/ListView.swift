//
//  ListView.swift
//  SwiftUIRouterTest
//
//  Created by Thomas Cowern on 9/10/24.
//

import SwiftUI

struct ListView: View {
    
    @Binding var navPaths: [Routes]
    
    var body: some View {
        Text("List View")
    }
}

#Preview {
    ListView(navPaths: .constant([]))
}
