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
    @State private var selection: String? = ""
    private let views: [TitledView]

    var body: some View {
        if sizeClass == .compact {
            TabView(selection: $selection) {
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
            NavigationStack {
                List(selection: $selection) {
                    ForEach(views, id: \.title) { item in
                        NavigationLink(destination: item.view, tag: item.title, selection: $selection) {
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
    
    init(content: [TitledView]) {
        views = content
        _selection = State(wrappedValue: content[0].title)
    }
}
