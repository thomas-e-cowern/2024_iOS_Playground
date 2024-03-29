//
//  NavigationRouter.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
        routes.append(screen)
    }
    
    func reset() {
        routes = []
    }
}
