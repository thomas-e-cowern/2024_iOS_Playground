//
//  NavigationItem.swift
//  NavigationStackPlayground
//
//  Created by Thomas Cowern on 9/5/24.
//

import Foundation

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

enum Menu: String {
    case compass
    case card
    case charts
    case radial
    case halfsheet
    case gooey
    case actionbutton
}
