//
//  BirdsNavigationStack.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct BirdsNavigationStack: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.birdRoutes) {
            Button("Go to detail") {
                router.birdRoutes.append(.detail(Bird(name: "Sparrow")))
            }.navigationDestination(for: BirdRoute.self) { route in
                switch route {
                case .home:
                    Text("Home")
                case .detail:
                    BirdDetailScreen(name: "Bluejay")
                }
            }
        }
    }
}

#Preview {
    BirdsNavigationStack()
}
