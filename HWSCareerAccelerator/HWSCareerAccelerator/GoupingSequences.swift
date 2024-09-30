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
            dump(favoriteCounts)
        }
    }
}

#Preview {
    GoupingSequences()
}
