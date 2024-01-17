//
//  ContentView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear {
                    print("➡ Users Reponse")
                    dump(
                        try? StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
                    )
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
