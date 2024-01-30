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
    
    var games: [Game] = [
        .init(name: "Minecraft", rating: "99"),
        .init(name: "God of War", rating: "98"),
        .init(name: "Fortnite", rating: "92"),
        .init(name: "Madded 2023", rating: "88")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform, label: {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        })
                    }
                }
                
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game, label: {
                            Text(game.name)
                        })
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Game.self) { game in
                ZStack {
                    Text("\(game.name) - \(game.rating)")
                        .font(.largeTitle).bold()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}
