//
//  HoveringLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

protocol HoveringLabelStyle: LabelStyle {
    init(hovering: Bool)
}

struct HoveringLabel<LabelStyle: HoveringLabelStyle, Title: View, Icon: View>: View {
    
    let style: LabelStyle.Type
    let title: () -> Title
    let icon: () -> Icon
    
    @State private var isHovered = false
    
    var body: some View {
        Label(title: title, icon: icon)
            .labelStyle(style.init(hovering: isHovered))
            .onHover(perform: { hovering in
                withAnimation {
                    isHovered = hovering
                }
            })
    }
}
