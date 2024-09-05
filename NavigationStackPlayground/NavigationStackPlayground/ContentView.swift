//
//  ContentView.swift
//  NavigationStackPlayground
//
//  Created by Thomas Cowern on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var navigationItems = [
        NavigationItem(title: "Compass App", icon: "safari", menu: .compass),
        NavigationItem(title: "3D Card", icon: "lanyardcard", menu: .card),
        NavigationItem(title: "Radial Layout", icon: "clock", menu: .radial),
        NavigationItem(title: "Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
        NavigationItem(title: "Gooey Menu", icon: "drop", menu: .gooey),
        NavigationItem(title: "Charts", icon: "chart.xyaxis.line", menu: .charts),
        NavigationItem(title: "Half Sheet", icon: "rectangle.portrait.bottomhalf.filled", menu: .halfsheet),
    ]

    
    var body: some View {
        VStack {
            NavigationStack {
                List(navigationItems) { item in
                    NavigationLink(value: item) {
                        Label(item.title, systemImage: item.icon)
                            .foregroundColor(.primary)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("SwiftUI apps")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavigationItem.self) { item in
                    switch item.menu {
                    case .compass:
                        CompassView()
                    case .card:
                        CardReflectionView()
                    case .charts:
                        ChartView()
                    case .radial:
                        RadialLayoutView()
                    case .halfsheet:
                        HalfSheetView()
                    case .gooey:
                        GooeyView()
                    case .actionbutton:
                        ActionButtonView()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
