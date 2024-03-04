//
//  MovieDetailScreen.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    var movie: Movie?
    
    var body: some View {
        VStack {
            Text(movie?.name ?? "")
            NavigationLink("Reviews", value: Route.reviews([Review(text: "Good movie")]))
        }
    }
}

#Preview {
    MovieDetailScreen()
}
