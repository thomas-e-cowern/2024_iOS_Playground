//
//  CustomTabBar.swift
//  CustomTabBarTest
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

enum TabType: CaseIterable {
    case heart
    case settings

    var titleKey: String {
        "\(self)".capitalized
    }

    var symbolName: String {
        switch self {
        case .heart: "heart"
        case .settings: "gearshape"
        }
    }
}

struct CustomTabBar: View {
    @Binding var selection: TabType
    
    @State private var count = 0

    var body: some View {
        HStack {
            ForEach(TabType.allCases, id: \.self) { type in
                Button {
                    selection = type
                    count = count + 1
                } label: {
                    Label(type.titleKey, systemImage: type.symbolName)
                        .labelStyle(TabLabelStyle())
                        .symbolVariant(selection == type ? .fill : .none)
                        .foregroundStyle(selection == type ? Color.accentColor : .red)
                        .frame(maxWidth: .infinity)
                }
                .symbolEffect(.breathe, value: count)
            }
        }
        .padding()
        .background(.bar)
        .overlay(alignment: .top) { Divider() }
    }
}

#Preview {
    CustomTabBar(selection: .constant(.heart))
}
