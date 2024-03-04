//
//  MovieListScreen.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    let movies = [Movie(name: "Spiderman"), Movie(name: "Batman")]
    
    var body: some View {
        
        List(movies, id: \.self) { movie in
            NavigationLink(movie.name, value: Route.detail(movie))
        }
        .padding()
        
    }
}

#Preview {
    MovieListScreen()
}
