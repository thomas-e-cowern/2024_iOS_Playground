//
//  HomeView.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("This is the Home View")
                .foregroundStyle(Color.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
    }
}

#Preview {
    HomeView()
}
