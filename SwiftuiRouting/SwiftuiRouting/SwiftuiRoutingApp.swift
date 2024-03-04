//
//  SwiftuiRoutingApp.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI

enum Route: Hashable {
    case list
    case detail(Movie)
    case reviews([Review])
}

@main
struct SwiftuiRoutingApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .list:
                            MovieListScreen()
                        case .detail(let movie):
                            MovieDetailScreen(movie: movie)
                        case .reviews(let reviews):
                            MovieReviewScreen(reviews: reviews)
                            
                        }
                    }
            }
        }
    }
}
