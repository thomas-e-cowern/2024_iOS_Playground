//
//  Route.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import Foundation

enum Route: Hashable {
    case menuItem(item: any MenuItem)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.menuItem(let lhsItem), .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        }
    }
}
