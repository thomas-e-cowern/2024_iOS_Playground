//
//  ContentView.swift
//  CustomTabBarTest
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = TabType.heart

     var body: some View {
         VStack(spacing: 0) {
             ZStack {
                 switch selection {
                 case .heart: FirstView()
                 case .settings: SecondView()
                 }
             }
             .frame(maxWidth: .infinity, maxHeight: .infinity)

             CustomTabBar(selection: $selection)
         }
     }
}

#Preview {
    ContentView()
}
