//
//  TabbedSidebar.swift
//  TabbedSidebarPlayground
//
//  Created by Thomas Cowern on 6/1/24.
//

import Foundation
import SwiftUI

struct TabbedSidebar: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    private let views: [TitledView]

    var body: some View {
        if sizeClass == .compact {
            TabView {
                ForEach(views, id: \.title) { item in
                    item.view
                        .tabItem {
                            Text(item.title)
                            item.icon
                        }
                        .tag(item.title)
                }
            }
        } else {
            NavigationView {
                List {
                    ForEach(views, id: \.title) { item in
                        NavigationLink(destination: item.view) {
                            Label {
                                Text(item.title)
                            } icon: {
                                item.icon
                            }
                        }
                        .tag(item.title)
                    }
                }
                .listStyle(SidebarListStyle())
            }
        }
    }
}
