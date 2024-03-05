//
//  Routing.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/5/24.
//

import Foundation

enum PlantRoute {
    case home
    case detail
}

struct Bird: Hashable {
    let name: String
}

enum BirdRoute: Hashable {
    case home
    case detail(Bird)
}

enum BackyardRoute: Hashable {
    case home
    case detail
}

@Observable
class Router {
    var birdRoutes: [BirdRoute] = []
    var plantRoutes: [PlantRoute] = []
    var BackyardRoutes: [BackyardRoute] = []
}
