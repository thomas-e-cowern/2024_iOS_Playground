//
//  PlantsNavigationStack.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct PlantsNavigationStack: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.plantRoutes) {
            Button("Plants Go to detail") {
                router.plantRoutes.append(.detail)
            }.navigationDestination(for: PlantRoute.self) { route in
                switch route {
                case .home:
                    Text("Home")
                case .detail:
                    Text("Plant Detail")
                }
            }
        }
    }
}

#Preview {
    PlantsNavigationStack()
}
