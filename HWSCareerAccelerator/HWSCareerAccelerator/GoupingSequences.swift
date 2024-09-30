//
//  GoupingSequences.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 9/30/24.
//

import SwiftUI

enum Genre {
    case action, family, fantasy, horror, sciFi
}

struct Movie: Hashable {
    var name: String
    var genre: Genre
}

struct GoupingSequences: View {
    
    let movies = [
        Movie(name: "The Lord of the Rings", genre: .fantasy),
        Movie(name: "The Matrix", genre: .sciFi),
        Movie(name: "Minority Report", genre: .sciFi)
    ]
    
    var favoriteTVShows = ["Red Dwarf", "Blackadder", "Red Dwarf", "Fawlty Towers", "Red Dwarf"]
    
    let gameHeroes: KeyValuePairs = [
        "Mario": ["Mario Kart", "Super Mario Bros"],
        "Link": ["Breath of the Wild", "Tears of the Kingdom"],
        "Mario": ["Super Mario World", "Super Mario Galaxy"]
    ]
    
    var body: some View {
        ForEach(movies, id: \.self) { movie in
            Text(movie.name)
                .font(.headline)
                .foregroundStyle(Color.primary.opacity(0.5))
        }
        
        Button("Group by genre") {
            var favoriteCounts = [String: Int]()
            
            for show in favoriteTVShows {
                favoriteCounts[show, default: 0] += 1
            }
            dump(gameHeroes)
            print(gameHeroes[1].key)
            print(gameHeroes[1].value)
            
            for hero in gameHeroes {
                print("\(hero.key): \(hero.value.formatted(.list(type: .and)))")
            }
        }
    }
}

#Preview {
    GoupingSequences()
}
