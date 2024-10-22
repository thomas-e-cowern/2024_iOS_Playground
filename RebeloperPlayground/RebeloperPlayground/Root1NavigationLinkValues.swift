//
//  Root1NavigationLinkValues.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

enum Root1NavigationLinkValues: Hashable, View {
    
    case destination1
    case destination2(title: String)
    
    var body: some View {
        switch self {
        case .destination1:
            Destination1View()
        case .destination2(title: let title):
            Text(title)
        }
    }
}
