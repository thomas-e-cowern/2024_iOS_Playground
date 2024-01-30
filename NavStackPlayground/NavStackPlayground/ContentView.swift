//
//  ContentView.swift
//  NavStackPlayground
//
//  Created by Thomas Cowern on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    var platforms: [Platform] = [
        .init(name: "Xbox", imageName: "xbox.logo", color: .green),
        .init(name: "Playstation", imageName: "playstation.logo", color: .indigo),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .mint)
    ]
    
    var body: some View {
        List {
            Section("Platofrms") {
                ForEach(platforms, id: \.name) { platform in
                    Label(platform.name, systemImage: platform.imageName)
                        .foregroundColor(platform.color)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Platform {
    let name: String
    let imageName: String
    let color: Color
}
